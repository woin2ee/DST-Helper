import 'package:dst_helper/models/v2/status_value.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('DurationStatusValue verbose', () {
    const status = DurationStatusValue(
      initialValue: 15,
      value: 30,
      minute: 1,
    );
    expect(status.verbose(), '15 + 30 over 1 min');
  });
}
