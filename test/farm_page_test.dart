import 'package:dst_helper/farm_page/farm_page_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  group('Test [FarmPageNotifier]', () {
    late FarmPageModel subject;

    setUp(() {
      SharedPreferencesAsyncPlatform.instance = InMemorySharedPreferencesAsync.empty();
      subject = FarmPageModel();
    });

    test('Test initial state', () {
      final initialList = subject.farmCardModelsBySelectedSeason;
      expect(initialList.isEmpty, true);
    });

    test('Test `initFromPrefs` call', () async {
      await subject.initFromPrefs();
      final initialList = subject.farmCardModelsBySelectedSeason;
      expect(initialList.isNotEmpty, true);
    });
  });
}
