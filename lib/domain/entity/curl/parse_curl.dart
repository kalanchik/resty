part of 'curl_request.dart';

class _CurlParseResult {
  String method = 'GET';
  String url = '';
  final headers = <String, String>{};
  CurlBody? body;
  final queryParameters = <String, String>{};
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
    throw const FormatException('URL not found');
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
    uri.queryParameters.map((k, v) => MapEntry(k, v)),
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
