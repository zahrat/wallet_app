import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_app/extensions/number_extension.dart';

void main() {
  group('extension test', () {
    test('should format decimal number with commas', () {
      const double number = 123.005;
      final String result = number.separateByComma();

      expect(result, equals("123.005"));
    });
    test('should format negative decimal number with commas', () {
      const double number = -12345.566;
      final String result = number.separateByComma();

      expect(result, equals("-12,345.566"));
    });

    test('should format integer number with commas', () {
      const double number = 1245;
      final String result = number.separateByComma();

      expect(result, equals("1,245"));
    });
  });
}
