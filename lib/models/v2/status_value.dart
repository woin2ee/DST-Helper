sealed class StatusValue {
  const StatusValue();
}

class NumericStatusValue extends StatusValue {
  const NumericStatusValue(this.value);

  final double value;

  @override
  String toString() {
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
    return '${value.toString()} in ${minute.toString()}min';
  }
}
