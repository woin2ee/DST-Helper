import 'dart:ui';

enum Season {
  spring,
  summer,
  autumn,
  winter;

  Color get personalColor {
    switch (this) {
      case Season.spring:
        return const Color.fromRGBO(132, 197, 91, 1.0);
      case Season.summer:
        return const Color.fromRGBO(255, 209, 150, 1.0);
      case Season.autumn:
        return const Color.fromRGBO(199, 79, 60, 1.0);
      case Season.winter:
        return const Color.fromRGBO(154, 192, 255, 1.0);
    }
  }
}

typedef Seasons = Set<Season>;
