import 'package:baseball/src/domain/baseball_numbers.dart';
import 'package:baseball/src/domain/baseball_numbers_generator.dart';
import 'package:baseball/src/domain/picther_player.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PictherPlayer)
class ComputerPicherPlayer implements PictherPlayer {
  final BaseBallNumbersGenerator _generator;

  ComputerPicherPlayer({required BaseBallNumbersGenerator generator})
      : _generator = generator;

  @override
  BaseBallNumbers onCreateBaseballNumbers() {
    return _generator.create();
  }
}
