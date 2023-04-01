import 'package:flutter/material.dart';
import 'package:spotify_clone/json/songs_json.dart';
import 'package:spotify_clone/pages/album_page.dart';


Route createRoute(index) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const AlbumPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return  AlbumPage(
        song: songs[index],);
    },
  );
}
