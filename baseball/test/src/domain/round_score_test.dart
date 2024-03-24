import 'package:baseball/src/domain/round_score.dart';
import 'package:test/test.dart';

void main() {
  group("잘못된 스코어를 가진 상태로 Round 의 스코어를 만들 수 없다.", () {
    test("0보다 작은 볼을 스코어로 가질 수 없다.", () {
      // given
      int ball = -1;
      // expect
      expect(
          () => RoundScore(strike: 0, ball: ball),
          throwsA(isFormatException.having((exception) => exception.message,
              "message", "0 이하 혹은 3이상의 볼은 존재할 수 없습니다.")));
    });
    test("3보다 큰 볼을 스코어로 가질 수 없다.", () {
      // given
      int ball = 4;
      // expect
      expect(
          () => RoundScore(strike: 0, ball: ball),
          throwsA(isFormatException.having((exception) => exception.message,
              "message", "0 이하 혹은 3이상의 볼은 존재할 수 없습니다.")));
    });
    test("0보다 작은 스트라이크를 스코어로 가질 수 없다.", () {
      // given
      int strike = -1;
      // expect
      expect(
          () => RoundScore(strike: strike, ball: 0),
          throwsA(isFormatException.having((exception) => exception.message,
              "message", "0 이하 혹은 3이상의 스트라이크는 존재할 수 없습니다.")));
    });
    test("3보다 큰 스트라이크를 스코어로 가질 수 없다.", () {
      // given
      int strike = 4;
      // expect
      expect(
          () => RoundScore(strike: strike, ball: 0),
          throwsA(isFormatException.having((exception) => exception.message,
              "message", "0 이하 혹은 3이상의 스트라이크는 존재할 수 없습니다.")));
    });
    test("3 스트라이크가 된 상태에서는 볼을 가질 수 없다.", () {
      // given
      int strike = 3;
      int ball = 1;
      // expect
      expect(
          () => RoundScore(strike: strike, ball: ball),
          throwsA(isFormatException.having((exception) => exception.message,
              "message", "잘못된 스코어 입니다. 3스트라이크에서는 볼이 존재할 수 없습니다.")));
    });
  });
}
