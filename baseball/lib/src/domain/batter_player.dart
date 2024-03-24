import 'package:baseball/src/domain/round_score.dart';
import 'package:baseball/src/presentation/game_state.dart';

abstract interface class BatterPlayer {
  void onStartGame();
  List<int> onRequestExpectedNumbers();
  GameState onRequestRestartOrEnd();
  void onRecievedRoundScore(RoundScore roundScore);
  void onWinning();
}