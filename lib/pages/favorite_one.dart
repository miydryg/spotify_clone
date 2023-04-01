import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/provider/MegaList.dart';

import '../provider/favorite_provider.dart';
import '../theme/colors.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final songs = provider.songs;
    return Scaffold(
        backgroundColor: black,
      appBar: const PreferredSize(
    preferredSize: Size.fromHeight(50.0), child: GetAppBar()),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return ListTile(
            title: Text( song, style: TextStyle(color: white),),
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
      ),
    );
  }
}
class GetAppBar extends StatelessWidget {
  const GetAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: black,
      elevation: 0,
      title: const Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Library',
              style: TextStyle(
                  fontSize: 20, color: white, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.list)
          ],
        ),
      ),
    );
  }
}