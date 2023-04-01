import 'package:flutter/material.dart';

class MyPlaylistProvider extends ChangeNotifier{
   List<Map<String, String>>  _songs = [];
  List<Map<String, String>> get songs => _songs;

  void toggleFavorite(Map<String, String> song){
    final isExist = _songs.contains(  song);
    if(isExist) {
      _songs.remove(song);
    }else{
      _songs.add(song );
    }
    notifyListeners();
  }

  bool isExist(Map<String, String> song){
    final isExist = _songs.contains(song);
    return isExist;
  }

  void clearFavorite(){
    _songs = [];
    notifyListeners();
  }
}