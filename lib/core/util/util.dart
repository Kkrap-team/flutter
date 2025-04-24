import 'dart:convert';

class Util {
  static String convertJsonToString(data) {
    try {
      if (data is String) {
        return data;
      } else if (data is Map || data is List) {
        var encoder = const JsonEncoder.withIndent('  ');
        return encoder.convert(data);
      }
      return data.toString();
    } catch (e) {
      return data.toString();
    }
  }
}
