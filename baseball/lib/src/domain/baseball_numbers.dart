import 'package:baseball/src/domain/round_score.dart';

final class BaseBallNumbers {
  static const int requiredSize = 3;
  static const int maxNumber = 9;
  static const int minNumber = 1;

  final List<int> _answer;

  BaseBallNumbers.of(List<int> numbers) : _answer = List.unmodifiable(numbers) {
    validateSize(_answer);
    _answer.forEach(validateNumber);
  }

  void validateSize(Iterable<int> numbers) {
    if (numbers.toSet().length != requiredSize) {
      throw FormatException("BaseBallNumbers는 서로 다른 숫자 3개로 이루어져야 합니다.");
    }
  }

  void validateNumber(int number) {
    if (number > maxNumber || number < minNumber) {
      throw FormatException(
          "BaseBall Numbers 는 $minNumber ~ $maxNumber 범위에 해당해야 합니다. 잘못된 숫자: $number");
    }
  }

  RoundScore scoreFrom(BaseBallNumbers otherNumbers) {
    var strikeCount = _countStrike(otherNumbers);
    var ballCount = _countBall(otherNumbers);
    return RoundScore(strike: strikeCount, ball: ballCount - strikeCount);
  }

  int _countBall(BaseBallNumbers otherNumbers) =>
      _answer.toSet().intersection(otherNumbers._answer.toSet()).length;

  int _countStrike(BaseBallNumbers otherNumbers) {
    var count = 0;
    for (var index = 0; index < requiredSize; index++) {
      if (_answer[index] == otherNumbers._answer[index]) {
        count++;
      }
    }
    return count;
  }
}