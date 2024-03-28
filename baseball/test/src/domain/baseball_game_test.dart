import 'package:baseball/src/domain/baseball_game.dart';
import 'package:baseball/src/domain/baseball_numbers.dart';
import 'package:baseball/src/domain/round_score.dart';
import 'package:test/test.dart';

void main() {
  group('정답 숫자 리스트와 예상 숫자 리스트로 해당 라운드 점수를 알 수 있다.', () {
    test('1,2,3 이 답일때 4,5,6을 예상하면 낫싱이다.', () {
      // given
      final BaseBallNumbers answer = BaseBallNumbers.of(numbers: [1, 2, 3]);
      final BaseBallNumbers expected = BaseBallNumbers.of(numbers: [4, 5, 6]);
      // when
      final RoundScore score =
          BaseBallGame(answerNumbers: answer).play(expectedNumbers: expected);
      // then
      expect(
        score.toString(),
        equals(RoundScore(strike: 0, ball: 0).toString()),
      );
    });
    test('1,2,3 이 답일때 3,5,6을 예상하면 1볼이다.', () {
      // given
      final BaseBallNumbers answer = BaseBallNumbers.of(numbers: [1, 2, 3]);
      final BaseBallNumbers expected = BaseBallNumbers.of(numbers: [3, 5, 6]);
      // when
      final RoundScore score =
          BaseBallGame(answerNumbers: answer).play(expectedNumbers: expected);
      // then
      expect(
        score.toString(),
        equals(RoundScore(strike: 0, ball: 1).toString()),
      );
    });
    test('1,2,3 이 답일때 4,5,3을 예상하면 1스트라이크이다.', () {
      // given
      final BaseBallNumbers answer = BaseBallNumbers.of(numbers: [1, 2, 3]);
      final BaseBallNumbers expected = BaseBallNumbers.of(numbers: [4, 5, 3]);
      // when
      final RoundScore score =
          BaseBallGame(answerNumbers: answer).play(expectedNumbers: expected);
      // then
      expect(
        score.toString(),
        equals(RoundScore(strike: 1, ball: 0).toString()),
      );
    });
    test('1,2,3 이 답일때 1,5,2을 예상하면 1볼 1스트라이크이다.', () {
      // given
      final BaseBallNumbers answer = BaseBallNumbers.of(numbers: [1, 2, 3]);
      final BaseBallNumbers expected = BaseBallNumbers.of(numbers: [1, 5, 2]);
      // when
      final RoundScore score =
          BaseBallGame(answerNumbers: answer).play(expectedNumbers: expected);
      // then
      expect(
        score.toString(),
        equals(RoundScore(strike: 1, ball: 1).toString()),
      );
    });
    test('1,2,3 이 답일때 1,2,3을 예상하면 3스트라이크이다.', () {
      // given
      final BaseBallNumbers answer = BaseBallNumbers.of(numbers: [1, 2, 3]);
      final BaseBallNumbers expected = BaseBallNumbers.of(numbers: [1, 2, 3]);
      // when
      final RoundScore score =
          BaseBallGame(answerNumbers: answer).play(expectedNumbers: expected);
      // then
      expect(
        score.toString(),
        equals(RoundScore(strike: 3, ball: 0).toString()),
      );
    });
  });
}
