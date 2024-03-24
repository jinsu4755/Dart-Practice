import 'package:baseball/src/domain/baseball_numbers.dart';
import 'package:baseball/src/domain/baseball_numbers_generator.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseBallNumbersGenerator)
final class AutoBaseBallNumbersGenerator implements BaseBallNumbersGenerator {
  @override
  BaseBallNumbers create() {
    final numbers = List<int>.generate(BaseBallNumbers.maxNumber,
        (index) => BaseBallNumbers.minNumber + index);
    numbers.shuffle();
    final answerNumbers = numbers.take(BaseBallNumbers.requiredSize).toList();
    return BaseBallNumbers.of(answerNumbers);
  }
}
