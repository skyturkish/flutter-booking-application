import 'package:flutter/foundation.dart';

class IconsPageViewModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _initialPageCount = 0;
  int get pageCount => _initialPageCount;

  void changePageCount(int value) {
    _initialPageCount = value;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('countPage', _initialPageCount));
  }
}
