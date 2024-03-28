import 'package:baseball/src/configuration.dart';
import 'package:baseball/src/presentation/baseball_game_manager.dart';

void main() {
  configureDependencies();
  getIt<BaseballGameManager>().start();
}