import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

sealed class ResponseStatusCode extends Equatable {
  const ResponseStatusCode();

  int get statusCode;
  String statusName(BuildContext context);

  factory ResponseStatusCode.fromHttp(int statusCode) {
    if (statusCode >= 100 && statusCode < 200) {
      return ResponseStatusCodeInfo(statusCode: statusCode);
    }

    if (statusCode >= 200 && statusCode < 300) {
      return ResponseStatusCodeSuccess(statusCode: statusCode);
    }

    if (statusCode >= 300 && statusCode < 400) {
      return ResponseStatusCodeRedirect(statusCode: statusCode);
    }

    if (statusCode >= 400 && statusCode < 500) {
      return ResponseStatusCodeClientError(statusCode: statusCode);
    }

    return ResponseStatusCodeServerError(statusCode: statusCode);
  }
}

class ResponseStatusCodeInfo extends ResponseStatusCode {
  const ResponseStatusCodeInfo({required this.statusCode});

  static const Map<int, String> infoStatuses = {
    100: "Continue",
    101: "Switching Protocols",
    102: "Processing",
  };

  @override
  final int statusCode;

  @override
  String statusName(BuildContext context) {
    if (infoStatuses.containsKey(statusCode)) {
      return infoStatuses[statusCode]!;
    }

    return "Unknown";
  }

  @override
  List<Object?> get props => [statusCode];
}

class ResponseStatusCodeSuccess extends ResponseStatusCode {
  const ResponseStatusCodeSuccess({required this.statusCode});

  static const Map<int, String> successStatuses = {
    200: "OK",
    201: "Created",
    202: "Accepted",
    203: "Non-Authoritative Information",
    204: "No Content",
    205: "Reset Content",
    206: "Partial Content",
  };

  @override
  final int statusCode;

  @override
  String statusName(BuildContext context) {
    if (successStatuses.containsKey(statusCode)) {
      return successStatuses[statusCode]!;
    }

    return "Unknown";
  }

  @override
  List<Object?> get props => [statusCode];
}

class ResponseStatusCodeRedirect extends ResponseStatusCode {
  const ResponseStatusCodeRedirect({required this.statusCode});

  static const Map<int, String> redirectStatuses = {
    301: "Moved Permanently",
    302: "Found",
    303: "See Other",
    304: "Not Modified",
    307: "Temporary Redirect",
    308: "Permanent Redirect",
  };

  @override
  final int statusCode;

  @override
  String statusName(BuildContext context) {
    if (redirectStatuses.containsKey(statusCode)) {
      return redirectStatuses[statusCode]!;
    }

    return "Unknown";
  }

  @override
  List<Object?> get props => [statusCode];
}

class ResponseStatusCodeClientError extends ResponseStatusCode {
  const ResponseStatusCodeClientError({required this.statusCode});

  static const Map<int, String> clientErrorStatuses = {
    400: "Bad Request",
    401: "Unauthorized",
    402: "Payment Required",
    403: "Forbidden",
    404: "Not Found",
    405: "Method Not Allowed",
    406: "Not Acceptable",
    407: "Proxy Authentication Required",
    408: "Request Timeout",
    429: "Too Many Requests",
  };

  @override
  final int statusCode;

  @override
  String statusName(BuildContext context) {
    if (clientErrorStatuses.containsKey(statusCode)) {
      return clientErrorStatuses[statusCode]!;
    }

    return "Unknown";
  }

  @override
  List<Object?> get props => [statusCode];
}

class ResponseStatusCodeServerError extends ResponseStatusCode {
  const ResponseStatusCodeServerError({required this.statusCode});

  static const Map<int, String> serverErrorStatuses = {
    500: "Internal Server Error",
    501: "Not Implemented",
    502: "Bad Gateway",
    503: "Service Unavailable",
    504: "Gateway Timeout",
    505: "HTTP Version Not Supported",
  };

  @override
  final int statusCode;

  @override
  String statusName(BuildContext context) {
    if (serverErrorStatuses.containsKey(statusCode)) {
      return serverErrorStatuses[statusCode]!;
    }

    return "Unknown";
  }

  @override
  List<Object?> get props => [statusCode];
}
