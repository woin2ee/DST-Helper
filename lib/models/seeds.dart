import 'package:dst_helper/models/item.dart';

abstract class Seeds implements Item {
  const Seeds(this.assumedName);

  final String? assumedName;
}
