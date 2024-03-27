import 'package:injectable/injectable.dart';

import '../domain/baseball_numbers.dart';
import '../domain/baseball_numbers_generator.dart';
import '../domain/picther_player.dart';

@Injectable(as: PictherPlayer)
class AutoPicherPlayer implements PictherPlayer {
  final BaseBallNumbersGenerator _generator;

  AutoPicherPlayer({required final BaseBallNumbersGenerator generator})
      : _generator = generator;

  @override
  BaseBallNumbers onCreateBaseballNumbers() {
    return _generator.create();
  }
}
