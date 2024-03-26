import 'package:baseball/src/domain/baseball_game.dart';
import 'package:baseball/src/domain/baseball_numbers.dart';
import 'package:baseball/src/domain/batter_player.dart';
import 'package:baseball/src/domain/picther_player.dart';
import 'package:baseball/src/domain/round_score.dart';
import 'package:baseball/src/presentation/game_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class BaseballGameManager {
  final PictherPlayer _picther;
  final BatterPlayer _batter;

  BaseballGameManager(
      {required PictherPlayer picther, required BatterPlayer batter})
      : _picther = picther,
        _batter = batter;

  void start() {
    _batter.onStartGame();
    final BaseBallGame game = _createGame();
    while(_playBaseballGame(game) == GameState.restart) {}
  }

  GameState _playBaseballGame(BaseBallGame game) {
    while(true) {
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
