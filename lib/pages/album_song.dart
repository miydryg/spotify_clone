import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favorite_provider.dart';
import '../provider/playlist_provider.dart';
import '../route/route.dart';
import '../theme/colors.dart';

class AlbumSong extends StatelessWidget {
  const AlbumSong({
    Key? key,
    required this.song,
  }) : super(key: key);
  final List<Map<String, String>> song;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List songAlbums = song;
    final provider = Provider.of<FavoriteProvider>(context);
    return Column(
      children: List.generate(songAlbums.length, (index) {
        final song = songAlbums[index];
        return Padding(
          padding: const EdgeInsets.only(right: 30, left: 30, bottom: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(createRoute(index));
            },
            child: Row(
              children: [
                SizedBox(
                  width: (size.width - 60) * 0.77,
                  child: Text(
                    "${index + 1} " + songAlbums[index]['title'],
                    style: const TextStyle(color: white),
                  ),
                ),
                SizedBox(
                  width: (size.width - 60) * 0.23,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        songAlbums[index]['duration'],
                        style: const TextStyle(color: grey, fontSize: 14),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 25,
                          height: 35,
                          child: IconButton(
                            onPressed: () {
                              provider.toggleFavorite(song);
                            },
                            icon: provider.isExist(song)
                                ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                                : const Icon(Icons.favorite_border,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 25,
                          height: 35,
                          child: Consumer<MyPlaylistProvider>(
                            builder: (_, value, __) {
                              return IconButton(
                                onPressed: () {
                                  value.toggleFavorite(song);
                                },
                                icon: value.isExist(song)
                                    ? const Icon(
                                  Icons.add_box_outlined,
                                  color: Colors.green,
                                )
                                    : const Icon(Icons.add_box,
                                    color: Colors.white),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}