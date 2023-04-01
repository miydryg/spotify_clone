

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/json/songs_json.dart';


import '../provider/favorite_provider.dart';
import 'favorite.dart';

class IconFavorite extends StatelessWidget {
  final dynamic song;
  const IconFavorite(this.song,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final words = nouns.take(50).toList();
    List songAlbums = songs;
    return

       ListView.builder(
        itemCount: songAlbums.length,
        itemBuilder: (context, index) {
          final song = songAlbums[index];
          final provider = Provider.of<FavoriteProvider>(context);
          return ListTile(
            title: Text(song),
            trailing: IconButton(
              onPressed: () {
                provider.toggleFavorite(song);
              },
              icon: provider.isExist(song)
                  ? const Icon(Icons.favorite, color: Colors.red,)
                  : const Icon(Icons.favorite_border),
            ),
          );
        },
      );
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        final route = MaterialPageRoute(builder: (context) => FavoritePage());
        Navigator.push(context, route);
      }, label: const Text('Favorite'));

  }
}