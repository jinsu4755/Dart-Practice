import 'package:test/test.dart';
import 'package:baseball/src/domain/baseball_numbers.dart';

void main() {
  test('숫자 야구에서 3개의 서로 다른 숫자로 숫자 목록을 만들 수 있다.', () {
    expect(() => BaseBallNumbers.of(numbers: [1, 2, 3]), returnsNormally);
  });

  group('숫자 야구에서 서로 같은 숫자가 포함되면 숫자 목록을 만들 수 없다.', () {
    test("1,1,2 로는 숫자 목록을 만들 수 없다.", () {
      // given
      var expectedNumbers = [1, 1, 2];
      // expect
      expect(
        () => BaseBallNumbers.of(numbers: expectedNumbers),
        throwsA(
          isFormatException.having(
            (final exception) => exception.message,
            "message",
            "BaseBallNumbers는 서로 다른 숫자 3개로 이루어져야 합니다.",
          ),
        ),
      );
    });

    test("1,1,1 로는 숫자 목록을 만들 수 없다.", () {
      // given
      var expectedNumbers = [1, 1, 1];
      // expect
      expect(
        () => BaseBallNumbers.of(numbers: expectedNumbers),
        throwsA(
          isFormatException.having(
            (final exception) => exception.message,
            "message",
            "BaseBallNumbers는 서로 다른 숫자 3개로 이루어져야 합니다.",
          ),
        ),
      );
    });
  });

  test("1~9 범위를 넘은 숫자가 있다면 숫자 목록을 만들 수 없다.", () {
    expect(
      () => BaseBallNumbers.of(numbers: [11, 1, 2]),
      throwsA(
        isFormatException.having(
          (final exception) => exception.message,
          "message",
          "BaseBall Numbers 는 1 ~ 9 범위에 해당해야 합니다. 잘못된 숫자: 11",
        ),
      ),
    );
  });

  group("두 숫자 야구 숫자들을 비교하여 스코어를 얻을 수 있다.", () {
    test("1,2,3 이 주어지고 3,6,9가 정답일 때, 결과는 1볼이다", () {
      // given
      var answer = BaseBallNumbers.of(numbers: [3, 6, 9]);
      var expectedNumbers = BaseBallNumbers.of(numbers: [1, 2, 3]);
      // when
      var score = expectedNumbers.scoreFrom(answer);
      // then
      expect(score.toString(), equals("1볼"));
    });
    test("3,9,6 이 주어지고 3,6,9가 정답일 때, 결과는 1 스트라이크 2볼이다", () {
      // given
      var answer = BaseBallNumbers.of(numbers: [3, 6, 9]);
      var expectedNumbers = BaseBallNumbers.of(numbers: [3, 9, 6]);
      // when
      var score = expectedNumbers.scoreFrom(answer);
      // then
      expect(score.toString(), equals("2볼 1스트라이크"));
    });
    test("3,6,9 이 주어지고 3,6,9가 정답일 때, 결과는 3 스트라이크이다", () {
      // given
      var answer = BaseBallNumbers.of(numbers: [3, 6, 9]);
      var expectedNumbers = BaseBallNumbers.of(numbers: [3, 6, 9]);
      // when
      var score = expectedNumbers.scoreFrom(answer);
      // then
      expect(score.toString(), equals("3스트라이크"));
    });
  });
}
