import 'baseball_numbers.dart';
import 'baseball_numbers_generator.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseBallNumbersGenerator)
final class AutoBaseBallNumbersGenerator implements BaseBallNumbersGenerator {
  @override
  BaseBallNumbers create() {
    final numbers = List<int>.generate(
      BaseBallNumbers.maxNumber,
      (final index) => BaseBallNumbers.minNumber + index,
    );
    numbers.shuffle();
    final answerNumbers = numbers
        .take(
          BaseBallNumbers.requiredSize,
        )
        .toList();
    return BaseBallNumbers.of(numbers: answerNumbers);
  }
}
