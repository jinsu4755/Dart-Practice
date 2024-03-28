import 'dart:convert';
import 'dart:io';

final class ConsoleReader {
  static const String _readLineFormatExceptionMessage =
      "입력을 읽을 수 없습니다. 다시 시도해주세요";

  static String read() => _readLine();

  static List<String> readNumbers() {
    var line = _readLine();
    return _splitNumberWords(line);
  }

  static String _readLine() =>
      stdin.readLineSync(encoding: utf8) ??
      (throw FormatException(_readLineFormatExceptionMessage));

  static List<String> _splitNumberWords(final String value) => value.split(" ");
}
