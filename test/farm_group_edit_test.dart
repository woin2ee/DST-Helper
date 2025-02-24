import 'package:dst_helper/farm_page/farm_group_editor/farm_group_editor_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  group('FarmGroupEdit Tests', () {
    late FarmGroupEditorModel subject;

    setUp(() {
      SharedPreferencesAsyncPlatform.instance = InMemorySharedPreferencesAsync.empty();
      subject = FarmGroupEditorModel.init();
    });

    test('Test init', () {
      expect(subject.hasChanges, false);
    });
  });
}
