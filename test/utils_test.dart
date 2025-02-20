import 'package:dst_helper/utils/etc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test postposition with Korean word', () {
    test('Test the example in the docs comments', () {
      final s = '나'.postpositioned('은', '는');
      final o = '사과'.postpositioned('을', '를');

      expect('$s $o 먹었다.', '나는 사과를 먹었다.');
    });

    test('Test final consonant postposition', () {
      expect('대한민국'.postpositioned('은', '는'), '대한민국은');
      expect('세종대왕님'.postpositioned('이', '가'), '세종대왕님이');
      expect('한글'.postpositioned('을', '를'), '한글을');
    });

    test('Test none final consonant postposition', () {
      expect('나'.postpositioned('은', '는'), '나는');
      expect('누나'.postpositioned('이', '가'), '누나가');
      expect('사과'.postpositioned('을', '를'), '사과를');
    });
  });
}
