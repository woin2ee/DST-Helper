import 'package:flutter/foundation.dart';

sealed class StatusValue {
  const StatusValue();
}

class NumericStatusValue extends StatusValue {
  const NumericStatusValue(this.value);

  final double value;

  @override
  String toString() {
    if (kIsWeb) {
      return value.toString();
    }
    final regex = RegExp(r'([.]*0)(?!.*\d)');
    return value.toString().replaceAll(regex, '');
  }
}

class NotApplicableStatusValue extends StatusValue {
  const NotApplicableStatusValue();

  @override
  String toString() {
    return 'N/A';
  }
}

class DayStatusValue extends StatusValue {
  const DayStatusValue(this.value);

  final int value;

  @override
  String toString() {
    return '${value.toString()}d';
  }
}

class SecStatusValue extends StatusValue {
  const SecStatusValue(this.value);

  final int value;

  @override
  String toString() {
    return '${value.toString()}s';
  }
}

class DurationStatusValue extends StatusValue {
  const DurationStatusValue({
    this.initialValue,
    required this.value,
    required this.minute,
  });

  final double? initialValue;
  final double value;
  final int minute;

  @override
  String toString() {
    final totalValue = (initialValue ?? 0) + value;
    if (kIsWeb) {
      return totalValue.toString();
    }
    final regex = RegExp(r'([.]*0)(?!.*\d)');
    return totalValue.toString().replaceAll(regex, '');
  }

  String verbose() {
    final regex = RegExp(r'([.]*0)(?!.*\d)');

    final String trimValue;
    if (kIsWeb) {
      trimValue = value.toString();
    } else {
      trimValue = value.toString().replaceAll(regex, '');
    }

    final String durationText = '$trimValue over $minute min';

    final initialValue = this.initialValue;
    if (initialValue != null) {
      final trimInitialValue = initialValue.toString().replaceAll(regex, '');
      return '$trimInitialValue + $durationText';
    } else {
      return durationText;
    }
  }
}
