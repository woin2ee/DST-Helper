import 'package:dst_helper/farm_page/edit_farm_set/farm_group_edit_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  group('FarmGroupEdit Tests', () {
    late FarmGroupEditController subject;

    setUp(() {
      SharedPreferencesAsyncPlatform.instance = InMemorySharedPreferencesAsync.empty();
      subject = FarmGroupEditController.init();
    });

    test('Test init', () {
      expect(subject.hasChanges, false);
    });
  });
}
