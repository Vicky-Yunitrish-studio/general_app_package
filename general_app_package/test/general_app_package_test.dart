import 'package:flutter_test/flutter_test.dart';

import 'package:general_app_package/general_app_package.dart';

void main() {
  test('adds one to input values', () {
    final personalInfo = PersonalInfo();
    expect(personalInfo, isNotNull);
  });
}
