class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => message;
}

class LiturgyNotFoundException extends AppException {
  LiturgyNotFoundException(super.message);
}

class ApiException extends AppException {
  ApiException(super.message);
}

class NetworkException extends AppException {
  NetworkException(super.message);
}

class ParseException extends AppException {
  ParseException(super.message);
}