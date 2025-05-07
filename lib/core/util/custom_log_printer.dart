import 'package:logger/logger.dart';

class CustomLogPrinter extends LogPrinter {
  static final Map<Level, String> levelPrefixes = {
    Level.debug: '[DEBUG]',
    Level.info: '[INFO ]',
    Level.warning: '[WARN ]',
    Level.error: '[ERROR]',
    Level.verbose: '[VERB ]',
    Level.wtf: '[WTF  ]',
  };

  @override
  List<String> log(LogEvent event) {
    final now = DateTime.now().toIso8601String();
    final caller = _getCallerFrame();
    final prefix = levelPrefixes[event.level] ?? '[LOG  ]';
    return ['$prefix [$now] $caller\n${event.message}'];
  }

  String _getCallerFrame() {
    final stackTrace = StackTrace.current.toString().split('\n');
    final frame = stackTrace.firstWhere(
      (line) =>
          line.contains('.dart') &&
          !line.contains('logger') &&
          !line.contains('app_logger.dart') &&
          !line.contains('custom_log_printer.dart') &&
          !line.trim().startsWith('dart:'),
      orElse: () => 'Unknown location',
    );
    return frame.trim();
  }
}
