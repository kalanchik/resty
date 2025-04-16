part of 'curl_request.dart';

class _CurlParseResult {
  String method = 'GET';
  String url = '';
  final headers = <String, String>{};
  CurlBody? body;
  final queryParameters = <String, String>{};
}

Curl _parseCurl(String curlCommand) {
  // Нормализация строки: заменяем '\--' на ' --' для правильного разбора
  curlCommand = curlCommand.replaceAll('\\--', ' --');

  // Удаляем лишние пробелы и переносы
  curlCommand = curlCommand.replaceAll(RegExp(r'\s+'), ' ').trim();

  if (!curlCommand.startsWith('curl ')) {
    throw FormatException('Not a valid curl command');
  }

  String method = 'GET';
  String url = '';
  Map<String, String> headers = {};
  CurlBody? body;
  Map<String, String> queryParameters = {};

  // Разбиваем команду на части, учитывая кавычки
  List<String> parts = [];
  StringBuffer currentPart = StringBuffer();
  bool inQuotes = false;

  for (int i = 0; i < curlCommand.length; i++) {
    String char = curlCommand[i];

    if (char == '"' || char == "'") {
      inQuotes = !inQuotes;
    } else if (char == ' ' && !inQuotes) {
      if (currentPart.isNotEmpty) {
        parts.add(currentPart.toString());
        currentPart.clear();
      }
    } else {
      currentPart.write(char);
    }
  }

  if (currentPart.isNotEmpty) {
    parts.add(currentPart.toString());
  }

  // Удаляем первый элемент "curl"
  if (parts.isNotEmpty && parts.first == 'curl') {
    parts.removeAt(0);
  }

  for (int i = 0; i < parts.length; i++) {
    String part = parts[i];
    String? nextPart = i + 1 < parts.length ? parts[i + 1] : null;

    if (part == '-X' && nextPart != null) {
      method = nextPart.toUpperCase();
      i++;
    } else if (part == '--request' && nextPart != null) {
      method = nextPart.toUpperCase();
      i++;
    } else if ((part == '-H' || part == '--header') && nextPart != null) {
      final headerParts = nextPart.split(':');
      if (headerParts.length >= 2) {
        String key = headerParts[0].trim();
        String value = headerParts.sublist(1).join(':').trim();
        headers[key] = value;
      }
      i++;
    } else if ((part == '-d' ||
            part == '--data' ||
            part == '--data-raw' ||
            part == '--data-ascii') &&
        nextPart != null) {
      body = CurlHttpBodyString(nextPart);
      // Пробуем распарсить JSON, если тело выглядит как JSON
      try {
        final String parseBody = nextPart;

        final bool isMap = parseBody.startsWith('{') && parseBody.endsWith('}');

        if (isMap) {
          body = CurlHttpBodyMap(jsonDecode(parseBody) as Map<String, dynamic>);
        }

        final bool isList =
            parseBody.startsWith('[') && parseBody.endsWith(']');

        if (isList) {
          body = CurlHttpBodyList(jsonDecode(parseBody) as List<dynamic>);
        }
      } catch (e) {
        log('JSON PARSE ERROR: ${e.toString()}');
        // Оставляем как строку, если не получилось распарсить
      }
      i++;
    } else if (part == '--data-binary' && nextPart != null) {
      body = CurlHttpBodyString(nextPart);
      i++;
    } else if (part == '--location' || part == '-L') {
      // Флаг следования редиректам - можно учесть в логике
      continue;
    } else if (!part.startsWith('-') && url.isEmpty) {
      url = part;

      // Извлекаем query параметры из URL
      final queryIndex = url.indexOf('?');
      if (queryIndex != -1) {
        final queryString = url.substring(queryIndex + 1);
        url = url.substring(0, queryIndex);

        final pairs = queryString.split('&');
        for (final pair in pairs) {
          final keyValue = pair.split('=');
          if (keyValue.length == 2) {
            queryParameters[keyValue[0]] = keyValue[1];
          }
        }
      }
    }
  }

  // Если есть тело, но метод не указан, предполагаем POST
  if (body != null && method == 'GET') {
    method = 'POST';
  }

  if (url.isEmpty) {
    throw FormatException('URL not found in curl command');
  }

  return CurlHttpRequest(
    url: url,
    method: HttpMethod.fromString(method),
    headers: headers,
    body: body,
    queryParameters: queryParameters.isNotEmpty ? queryParameters : null,
  );
}

Curl _parseCurlV2(String curlCommand) {
  final parts = _normalizeAndSplit(curlCommand);
  final result = _CurlParseResult();

  for (var i = 0; i < parts.length; i++) {
    final part = parts[i];
    final next = i + 1 < parts.length ? parts[i + 1] : null;

    if (part.startsWith('-')) {
      i = _handleFlag(part, next, i, result);
    } else if (result.url.isEmpty) {
      _handleUrl(part, result);
    }
  }

  return _finalizeResult(result);
}

CurlHttpRequest _finalizeResult(_CurlParseResult result) {
  // Автоматически устанавливаем POST для тела
  if (result.body != null && result.method == 'GET') {
    result.method = 'POST';
  }

  if (result.url.isEmpty) {
    throw FormatException('URL not found');
  }

  return CurlHttpRequest(
    url: result.url,
    method: HttpMethod.fromString(result.method),
    headers: result.headers,
    body: result.body,
    queryParameters: result.queryParameters,
  );
}

void _handleUrl(String url, _CurlParseResult result) {
  final uri = Uri.parse(url);
  result.url = uri.toString();

  result.queryParameters.addAll(
    uri.queryParameters.map((k, v) => MapEntry(k, v ?? '')),
  );
}

int _handleFlag(String flag, String? next, int index, _CurlParseResult result) {
  switch (flag) {
    case '-X':
    case '--request':
      if (next != null) {
        result.method = next.toUpperCase();
        return index + 1;
      }
      break;

    case '-H':
    case '--header':
      if (next != null) _parseHeader(next, result.headers);
      return index + 1;

    case '-d':
    case '--data':
    case '--data-raw':
    case '--data-ascii':
      if (next != null) {
        result.body = CurlBodyFactory.create(
          rawData: next,
          isBinary: false,
        );
      }
      return index + 1;

    case '--data-binary':
      if (next != null) {
        result.body = CurlBodyFactory.create(
          rawData: next,
          isBinary: true,
        );
      }
      return index + 1;
  }
  return index;
}

void _parseHeader(String headerLine, Map<String, String> headers) {
  final colonIndex = headerLine.indexOf(':');

  if (colonIndex == -1) {
    // Некорректный заголовок без двоеточия
    log('Invalid header format: $headerLine');
    return;
  }

  final key = headerLine.substring(0, colonIndex).trim();
  final value = headerLine.substring(colonIndex + 1).trim();

  if (key.isEmpty) {
    log('Empty header key in: $headerLine');
    return;
  }

  headers[key] = value;
}

List<String> _normalizeAndSplit(String curlCommand) {
  // Нормализация специальных последовательностей
  final normalized = curlCommand
      .replaceAll('\\--', ' --') // Экранированные дефисы
      .replaceAll('\\ ', ' ') // Экранированные пробелы
      .replaceAll(RegExp(r'\s+'), ' ') // Убираем множественные пробелы
      .trim();

  final parts = <String>[];
  final buffer = StringBuffer();
  bool inSingleQuotes = false;
  bool inDoubleQuotes = false;

  for (int i = 0; i < normalized.length; i++) {
    final char = normalized[i];

    if (char == "'" && !inDoubleQuotes) {
      inSingleQuotes = !inSingleQuotes;
      continue;
    } else if (char == '"' && !inSingleQuotes) {
      inDoubleQuotes = !inDoubleQuotes;
      continue;
    }

    if (char == ' ' && !inSingleQuotes && !inDoubleQuotes) {
      if (buffer.isNotEmpty) {
        parts.add(buffer.toString());
        buffer.clear();
      }
    } else {
      buffer.write(char);
    }
  }

  // Добавляем последнюю накопленную часть
  if (buffer.isNotEmpty) {
    parts.add(buffer.toString());
  }

  // Убираем слово "curl" в начале если есть
  if (parts.isNotEmpty && parts.first == 'curl') {
    parts.removeAt(0);
  }

  return parts;
}
