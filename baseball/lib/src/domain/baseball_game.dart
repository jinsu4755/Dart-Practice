import 'baseball_numbers.dart';
import 'round_score.dart';

final class BaseBallGame {

  final BaseBallNumbers answerNumbers;

  BaseBallGame({required this.answerNumbers});

  RoundScore play({required final BaseBallNumbers expectedNumbers}) {
    return expectedNumbers.scoreFrom(answerNumbers);
  }
}