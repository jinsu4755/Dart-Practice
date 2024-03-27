import 'package:injectable/injectable.dart';

import '../domain/baseball_game.dart';
import '../domain/baseball_numbers.dart';
import '../domain/batter_player.dart';
import '../domain/picther_player.dart';
import '../domain/round_score.dart';
import 'game_state.dart';

@Injectable()
final class BaseballGameManager {
  final PictherPlayer _picther;
  final BatterPlayer _batter;

  BaseballGameManager({
    required final PictherPlayer picther,
    required final BatterPlayer batter,
  })  : _picther = picther,
        _batter = batter;

  void start() {
    _batter.onStartGame();
    final BaseBallGame game = _createGame();
    while (_playBaseballGame(game) == GameState.restart) {}
  }

  GameState _playBaseballGame(final BaseBallGame game) {
    while (true) {
      final BaseBallNumbers expectedNumbers = _readExpectedNumbers();
      RoundScore score = game.play(expectedNumbers: expectedNumbers);
      _batter.onRecievedRoundScore(score);
      if (score.isThreeStrike()) break;
    }
    _batter.onWinning();
    return _batter.onRequestRestartOrEnd();
  }

  BaseBallGame _createGame() =>
      BaseBallGame(answerNumbers: _picther.onCreateBaseballNumbers());

  BaseBallNumbers _readExpectedNumbers() {
    final List<int> expectedNumbers = _batter.onRequestExpectedNumbers();
    return BaseBallNumbers.of(numbers: expectedNumbers);
  }
}
