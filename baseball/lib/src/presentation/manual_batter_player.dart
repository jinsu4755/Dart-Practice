import 'package:baseball/src/domain/batter_player.dart';
import 'package:baseball/src/domain/round_score.dart';
import 'package:baseball/src/extension/list_extension.dart';
import 'package:baseball/src/presentation/game_state.dart';
import 'package:baseball/src/view/baseball_game_printer.dart';
import 'package:baseball/src/view/console_reader.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BatterPlayer)
final class ManualBatterPlayer implements BatterPlayer {

  @override
  void onStartGame() {
    BaseBallGamePrinter.printGameStartMessage();
  }

  @override
  List<int> onRequestExpectedNumbers() {
    BaseBallGamePrinter.printReqeustExpectedNumbers();
    return ConsoleReader.readNumbers().mapToIntOrNull() ?? (throw FormatException("입력에 숫자가 아닌 문자가 있습니다."));
  }

  @override
  GameState onRequestRestartOrEnd() {
    BaseBallGamePrinter.printReqeustRestartOrEndMessage();
    var flag = int.tryParse(ConsoleReader.read()) ?? (throw FormatException("잘못된 입력입니다."));
    return GameState.of(flag);
  }

  @override
  void onRecievedRoundScore(RoundScore roundScore) {
    BaseBallGamePrinter.printRoundScore(roundScore);
  }

  @override
  void onWinning() {
    BaseBallGamePrinter.printGameWinnginMessage();
  }
  
}
