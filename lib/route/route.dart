import 'package:flutter/material.dart';
import 'package:spotify_clone/json/songs_json.dart';
import 'package:spotify_clone/pages/album_page.dart';


Route createRoute(index) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  AlbumPage(title: songs[index]['title'], img: songs[index]['img'],),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return  AlbumPage(
        song: songs[index], title: songs[index]['title'], img: songs[index]['img'],);
    },
  );
}
