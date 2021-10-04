import 'package:flutter/foundation.dart';
import 'package:submission_five/model.dart';

class ListProvider with ChangeNotifier {
  List<DynamicList> _list = <DynamicList>[];

  List<DynamicList> get getNotes{
    return _list;
  }

  String get description => description;

  String get title => title;

  void addItem(String title,String description) {
    DynamicList list = new DynamicList(title, description);
    _list.add(list);
    notifyListeners();
  }

  void deleteItem(int index) {
    _list.removeAt(index);
    notifyListeners();
  }
}