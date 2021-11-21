import 'package:flutter/foundation.dart';

class Sort with ChangeNotifier {
  bool empty;
  bool sorted;
  bool unsorted;

  Sort({
    required this.empty,
    required this.sorted,
    required this.unsorted,
  });
}
