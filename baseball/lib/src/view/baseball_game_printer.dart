import 'dart:io';

import '../domain/round_score.dart';

final class BaseBallGamePrinter {
  static const _startMessage = "숫자 야구 게임을 시작합니다.";
  static const _requestExpectedNumbersMessage = "숫자를 입력해주세요 : ";
  static const _requestRestartOrEndMessage = "게임을 새로 시작하려면 1, 종료하려면 2를 입력하세요.";
  static const _gameWinningMessage = "3개의 숫자를 모두 맞히셨습니다! 게임 종료";

  static void printGameStartMessage() => stdout.writeln(_startMessage);

  static void printReqeustExpectedNumbers() =>
      stdout.write(_requestExpectedNumbersMessage);

  static void printReqeustRestartOrEndMessage() =>
      stdout.writeln(_requestRestartOrEndMessage);

  static void printRoundScore(final RoundScore roundScore) =>
      stdout.writeln(roundScore);

  static void printGameWinnginMessage() => stdout.writeln(_gameWinningMessage);
}
