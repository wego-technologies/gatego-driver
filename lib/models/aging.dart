import 'package:flutter/foundation.dart';

class AgingInventory with ChangeNotifier {
  int id;
  int ageDays;
  String trailer;

  AgingInventory({
    required this.ageDays,
    required this.id,
    required this.trailer,
  });
}
