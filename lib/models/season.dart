import 'dart:ui';

enum Season {
  spring,
  summer,
  autumn,
  winter;

  String get name {
    switch (this) {
      case Season.spring:
        return '봄';
      case Season.summer:
        return '여름';
      case Season.autumn:
        return '가을';
      case Season.winter:
        return '겨울';
    }
  }

  Color get personalColor {
    switch (this) {
      case Season.spring:
        return const Color.fromRGBO(132, 197, 91, 1.0);
      case Season.summer:
        return const Color.fromRGBO(249, 209, 150, 1.0);
      case Season.autumn:
        return const Color.fromRGBO(199, 79, 60, 1.0);
      case Season.winter:
        return const Color.fromRGBO(154, 192, 241, 1.0);
    }
  }
}

typedef Seasons = Set<Season>;
