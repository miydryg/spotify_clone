import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/json/songs_json.dart';

import '../provider/playlist_provider.dart';
import '../provider/favorite_provider.dart';
import '../theme/colors.dart';
import 'package:spotify_clone/route/route_music_detail_page.dart';

class AlbumPage extends StatelessWidget {
  final dynamic song;
  final String title;
  final String img;
  const AlbumPage({
    Key? key,
    this.song, required this.title, required this.img,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AlbumPageBody( img: img,
        title: title,  song: song['songs'],),
    );
  }
}

class AlbumPageBody extends StatelessWidget {
   const AlbumPageBody({Key? key, required this.img,
    required this.title,  required this.song, }) : super(key: key);
  final String img;
  final String title;
   final List <Map<String, String>> song;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: white)),
                    Container(
                      decoration: BoxDecoration(
                          color: grey, borderRadius: BorderRadius.circular(5)),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child: Text(
                          'Subscribe',
                          style: TextStyle(color: white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: List.generate(songs.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(createRoute(index));
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(songs[index]['img']),
                                        fit: BoxFit.cover),
                                    color: primary,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                songs[index]['title'],
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: white,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: size.width - 210,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      songs[index]['song_count'],
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: grey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      songs[index]['date'],
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: grey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              //albumSong(),
              AlbumSong(
                song: song,
              )
            ],
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: white,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      color: white,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}


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
                      SizedBox(
                        width: 25,
                        height: 25,
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
                      SizedBox(
                        width: 25,
                        height: 25,
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


