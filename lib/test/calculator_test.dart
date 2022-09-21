import 'package:test/test.dart';
import 'package:unit_test1/math/calculator.dart';

void main() {
  late Calculator _calculator;
  setUp(() {
    _calculator = Calculator();
  });
  group('calculator test', () {
    test(
      'calculator.sumTwonNumber() sum both number',
      () => expect(_calculator.sumTwoNumber(5, 5), 10),
    );
    test(
      'calculator.sumTwonNumber() sum both number',
      () => expect(_calculator.sumTwoNumber(1, 5), 6),
    );
  });
}
