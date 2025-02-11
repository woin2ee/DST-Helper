import 'package:flutter/material.dart';

import '../../models/v2/status_value.dart';
import '../../utils/font_family.dart';

enum StatusKey {
  hunger,
  health,
  sanity,
  perish,
  cook,
  priority;

  String get symbolName {
    switch (this) {
      case StatusKey.hunger:
        return 'hunger_meter';
      case StatusKey.health:
        return 'health_meter';
      case StatusKey.sanity:
        return 'sanity_meter';
      case StatusKey.perish:
        return 'rot';
      case StatusKey.cook:
        return 'crock_pot';
      case StatusKey.priority:
        return 'priority';
    }
  }
}

class StatusPair extends StatelessWidget {
  const StatusPair({
    super.key,
    required this.statusKey,
    required this.statusValue,
  });

  final StatusKey statusKey;
  final StatusValue statusValue;

  static const double imageSize = 20;
  static const double spacing = 4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: spacing,
      children: [
        Image.asset(
          'assets/images/${statusKey.symbolName}.png',
          width: imageSize,
          height: imageSize,
        ),
        _StatusValueBox(statusValue: statusValue),
      ],
    );
  }
}

class _StatusValueBox extends StatelessWidget {
  const _StatusValueBox({
    required this.statusValue,
  });

  final StatusValue statusValue;

  static const double width = 52;
  static const textStyle = TextStyle(
    fontFamily: FontFamily.pretendard,
    fontSize: 13,
    color: Colors.black,
  );
  static const double tooltipIconSize = 16;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: _buildContent(statusValue),
    );
  }

  Widget _buildContent(StatusValue statusValue) {
    if (statusValue is DurationStatusValue) {
      return Tooltip(
        message: statusValue.verbose(),
        textStyle: const TextStyle(
          fontFamily: FontFamily.pretendard,
          fontSize: 12,
          color: Colors.white,
        ),
        decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        verticalOffset: 8,
        margin: const EdgeInsets.only(left: 132),
        padding: const EdgeInsets.only(top: 4, left: 10, right: 10, bottom: 4),
        enableTapToDismiss: false,
        preferBelow: false,
        showDuration: const Duration(),
        exitDuration: const Duration(),
        child: Center(
          child: Row(
            spacing: 2,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                statusValue.toString(),
                style: textStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                width: tooltipIconSize,
                height: tooltipIconSize,
                child: FittedBox(
                  child: Icon(
                    Icons.error_outline_rounded,
                    color: Color(0xff444444),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Text(
        statusValue.toString(),
        style: textStyle,
        textAlign: TextAlign.center,
      );
    }
  }
}
