final class RoundScore {
  static const String nothingSymbol = "낫싱";
  static const String ballSymbol = "볼";
  static const String strikeSymbol = "스트라이크";
  static const int maxScore = 3;

  final int _ball;
  final int _strike;

  RoundScore({required int strike, required int ball})
      : _strike = strike,
        _ball = ball {
    _validateBallScore();
    _validateStrikeScore();
    _validateTotalScore();
  }

  void _validateBallScore() {
    if (_ball < 0 || _ball > maxScore) {
      throw FormatException("0 이하 혹은 3이상의 볼은 존재할 수 없습니다.");
    }
  }

  void _validateStrikeScore() {
    if (_strike < 0 || _strike > maxScore) {
      throw FormatException("0 이하 혹은 3이상의 스트라이크는 존재할 수 없습니다.");
    }
  }

  void _validateTotalScore() {
    if (_strike == 3 && _ball != 0) {
      throw FormatException("잘못된 스코어 입니다. 3스트라이크에서는 볼이 존재할 수 없습니다.");
    }
  }

  bool _isNothing() => !_hasBall() && !_hasStrike();

  bool _hasBall() => _ball != 0;

  bool _hasStrike() => _strike != 0;

  bool isThreeStrike() => _strike == 3;

  @override
  String toString() {
    var roundScore = <String>[];
    if (_isNothing()) return nothingSymbol;
    if (_hasBall()) roundScore.add("$_ball$ballSymbol");
    if (_hasStrike()) roundScore.add("$_strike$strikeSymbol");
    return roundScore.join(" ");
  }
}
