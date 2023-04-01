import 'package:flutter/cupertino.dart';

class FavoriteProvider extends ChangeNotifier{
  List<String> _songs = [];
  List<String> get songs => _songs;

  void toggleFavorite(String song){
    final isExist = _songs.contains(song);
    if(isExist) {
      _songs.remove(song);
    }else{
      _songs.add(song);
    }
    notifyListeners();
  }

  bool isExist(String song){
    final isExist = _songs.contains(song);
    return isExist;
  }

void clearFavorite(){
  _songs = [];
    notifyListeners();
}
}