import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  static Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.none,
    ),
  );

  static void d(String message) {
    logger.d("${DateTime.now().toString()}\n$message");
  }

  static void i(String message) {
    logger.i("${DateTime.now().toString()}\n$message");
  }

  static void e(String message, {Object? error, StackTrace? stackTrace}) {
    logger.e(
      "${DateTime.now().toString()}\n$message",
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void w(String message) {
    logger.w("${DateTime.now().toString()}\n$message");
  }

  static void logPrint(dynamic obj) {
    if (obj is Error) {
      Log.e(
        obj.toString(),
        error: obj,
        stackTrace: obj.stackTrace ?? StackTrace.current,
      );
    } else if (kDebugMode) {
      print(obj);
    }
  }
}
