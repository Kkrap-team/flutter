import 'package:flutter/foundation.dart';
import 'package:krap/core/util/custom_log_printer.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: CustomLogPrinter(),
    // level: kReleaseMode ? Level.nothing : Level.debug,
  );

  static void v(message, {String tag = 'Krap'}) {
    if (!kReleaseMode) _logger.v(_format(message, tag));
  }

  static void d(message, {String tag = 'Krap'}) {
    if (!kReleaseMode) _logger.d(_format(message, tag));
  }

  static void i(message, {String? tag = 'Krap'}) {
    if (!kReleaseMode) _logger.i(_format(message, tag));
  }

  static void w(message, {String? tag = 'Krap'}) {
    if (!kReleaseMode) _logger.w(_format(message, tag));
  }

  static void e(message, {String? tag = 'Krap'}) {
    if (!kReleaseMode) _logger.e(_format(message, tag));
  }

  static String _format(message, String? tag) {
    return tag != null ? '[$tag] $message' : message.toString();
  }
}
