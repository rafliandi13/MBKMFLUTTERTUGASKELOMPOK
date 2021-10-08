import 'package:flutter/foundation.dart';
import 'package:submission_five/model.dart';

class ListProvider with ChangeNotifier {
  List<DynamicList> _list = <DynamicList>[];

  List<DynamicList> get getNotes {
    return _list;
  }

  String get description => description;

  String get title => title;

  void addItem(DynamicList list) {
    _list.add(list);
    notifyListeners();
  }

  void deleteItem(DynamicList list) {
    _list.remove(list);
    notifyListeners();
  }

  void updateItem(DynamicList list, String title, String description) {
    list.title = title;
    list.description = description;
    notifyListeners();
  }
}
