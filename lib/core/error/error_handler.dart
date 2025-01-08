import 'package:flutter/material.dart';

import 'failures.dart';

class ErrorHandler {
  static Failure handle(Exception exception, {StackTrace? stackTrace}) {
    if (exception is NetworkException) {
      return NetworkFailure('No internet connection');
    } else if (exception is ServerException) {
      return ServerFailure('Server error occurred');
    } else if (exception is FormatException) {
      return ServerFailure('Data format is invalid');
    } else {
      if (stackTrace != null) {
        debugPrintStack(stackTrace: stackTrace, label: 'Unhandled Exception');
      }
      return UnknownFailure('An unknown error occurred');
    }
  }
}

class NetworkException implements Exception {}

class ServerException implements Exception {}

class UnknownException implements Exception {}
