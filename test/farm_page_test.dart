import 'package:dst_helper/farm_page/farm_page_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  group('Test model', () {
    late FarmPageModel subject;

    setUp(() {
      SharedPreferencesAsyncPlatform.instance = InMemorySharedPreferencesAsync.empty();
      final prefs = SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(
          allowList: {
            FarmPageRepository.key,
          },
        ),
      );
      final repository = FarmPageRepository(prefs: Future.value(prefs));
      subject = FarmPageModel(repository: repository);
    });

    test('Test initial state', () {
      final initialList = subject.farmCardModelsBySelectedSeason;
      expect(initialList.isNotEmpty, true);
    });
  });
}
