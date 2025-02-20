String _keepKoreanWord(String text) {
  final RegExp emoji =
      RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');
  String fullText = '';
  final List<String> words = text.split(' ');
  for (var i = 0; i < words.length; i++) {
    fullText +=
        emoji.hasMatch(words[i]) ? words[i] : words[i].replaceAllMapped(RegExp(r'(\S)(?=\S)'), (m) => '${m[1]}\u200D');
    if (i < words.length - 1) fullText += ' ';
  }
  return fullText;
}

extension KoreanString on String {
  String get untruncatedKoreanByNewline {
    return _keepKoreanWord(this);
  }

  /// Returns a Korean word with the appropriate postposition appended according to the final consonant.
  ///
  /// [finalConsonantPostposition] and [noneFinalConsonantPostposition] are a pair of postpositions
  /// that can be followed by a Korean word like '이/가', '을/를', '은/는'.
  ///
  /// [finalConsonantPostposition] is a postposition used when a given Korean word has a final consonant, like '이', '을', and '은'.
  /// Meanwhile, [noneFinalConsonantPostposition] is used when it doesn’t, like '가', '를', and '는'.
  ///
  /// ```
  /// final s = '나'.postpositioned('은', '는') // '나는'
  /// final o = '사과'.postpositioned('을', '를') // '사과를'
  /// '$s $o 먹었다.' // '나는 사과를 먹었다.'
  /// ```
  String postpositioned(String finalConsonantPostposition, String noneFinalConsonantPostposition) {
    final lastCharUnicode = runes.last;

    if (lastCharUnicode < 0xAC00 || lastCharUnicode > 0xD7A3) {
      throw StateError('The last character of the string is not a Korean.');
    }

    final finalConsonant = (lastCharUnicode - 0xAC00) % 28;

    if (finalConsonant == 0) {
      return this + noneFinalConsonantPostposition;
    } else {
      return this + finalConsonantPostposition;
    }
  }
}
