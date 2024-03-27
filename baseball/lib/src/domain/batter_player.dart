import 'round_score.dart';
import '../presentation/game_state.dart';

abstract interface class BatterPlayer {
  void onStartGame();
  List<int> onRequestExpectedNumbers();
  GameState onRequestRestartOrEnd();
  void onRecievedRoundScore(final RoundScore roundScore);
  void onWinning();
}