import 'package:flutter/cupertino.dart';

class RootAppProvider extends ChangeNotifier{
  int activeTab = 0;

  int get menuTap{
    return activeTab;
  }

  void menuActiveTap(index){
    activeTab = index;
    notifyListeners();
  }
}