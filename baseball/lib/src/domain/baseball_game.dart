import 'package:baseball/src/domain/baseball_numbers.dart';
import 'package:baseball/src/domain/round_score.dart';

final class BaseBallGame {

  final BaseBallNumbers answerNumbers;

  BaseBallGame({required this.answerNumbers});

  RoundScore play({required BaseBallNumbers expectedNumbers}) {
    return expectedNumbers.scoreFrom(answerNumbers);
  }
}