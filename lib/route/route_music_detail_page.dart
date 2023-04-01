import 'package:flutter/material.dart';
import 'package:spotify_clone/json/songs_json.dart';
import 'package:spotify_clone/pages/music_detail_page.dart';


Route createRoute(index) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MusicDetailPage(
      title: songs[index]['title'],
      description: songs[index]['description'],
      color: songs[index]['color'],
      img: songs[index]['img'],
      songUrl: songs[index]['song_url'],
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return MusicDetailPage(
        title: songs[index]['title'],
        description: songs[index]['description'],
        color: songs[index]['color'],
        img: songs[index]['img'],
        songUrl: songs[index]['song_url'],
      );
    },
  );
}