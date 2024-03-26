import 'package:baseball/src/domain/round_score.dart';

final class BaseBallNumbers {
  static const int requiredSize = 3;
  static const int maxNumber = 9;
  static const int minNumber = 1;

  final List<int> _answer;

  Set<int> get _distinctAnswer => Set.from(_answer);

  BaseBallNumbers.of({required List<int> numbers})
      : _answer = List.unmodifiable(numbers) {
    _validateSize(_answer);
    _answer.forEach(_validateNumber);
  }

  void _validateSize(List<int> numbers) {
    if (_distinctAnswer.length != requiredSize) {
      throw FormatException("BaseBallNumbers는 서로 다른 숫자 3개로 이루어져야 합니다.");
    }
  }

  void _validateNumber(int number) {
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
      _distinctAnswer.intersection(otherNumbers._distinctAnswer).length;

  int _countStrike(BaseBallNumbers otherNumbers) =>
      Iterable.generate(requiredSize)
          .where((index) => _answer[index] == otherNumbers._answer[index])
          .length;
}
