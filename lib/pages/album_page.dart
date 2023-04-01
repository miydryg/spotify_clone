import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/json/songs_json.dart';

import '../provider/MegaList.dart';
import '../provider/favorite_provider.dart';
import '../theme/colors.dart';
import 'package:spotify_clone/route/route_music_detail_page.dart';
import 'home_page.dart';
import 'icon_favorite.dart';


class AlbumPage extends StatefulWidget {
  final dynamic song;

  const AlbumPage({Key? key,  this.song, }) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: albumPageBody(),
    );
  }


   // class albumPageBody extends StatelessWidget {
   // const albumPageBody({Key? key, this.song}) : super(key: key);
   // final dynamic song;
   // @override
  Widget albumPageBody() {
    var size = MediaQuery.of(context).size;
    List songAlbums = widget.song['songs'];

    final provider = Provider.of<FavoriteProvider>(context);
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
                        image: AssetImage(widget.song['img']),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.song['title'],
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: white)),
                    Container(
                      decoration: BoxDecoration(
                          color: grey, borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child: Text(
                          'Subcribe',
                          style: TextStyle(color: white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
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
              SizedBox(
                height: 30,
              ),

            albumSong(),
              AlbumPage2(song: widget.song['songs'], songAlbumsMega: widget.song['songs'],)

              // Column(
              //
              //   children: List.generate(songAlbums.length, (index) {
              //     final song = songAlbums[index];
              //     return Padding(
              //       padding:
              //           const EdgeInsets.only(right: 30, left: 30, bottom: 10),
              //       child: GestureDetector(
              //         onTap: () {},
              //         child: Row(
              //           children: [
              //             Container(
              //               width: (size.width - 60) * 0.77,
              //               child: Text(
              //                 "${index + 1} " + songAlbums[index]['title'],
              //                 style: TextStyle(color: white),
              //               ),
              //             ),
              //             Container(
              //               width: (size.width - 60) * 0.23,
              //               height: 50,
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Text(
              //                     songAlbums[index]['duration'],
              //                     style: TextStyle(color: grey, fontSize: 14),
              //                   ),
              //                   Container(
              //                     width: 25,
              //                     height: 25,
              //
              //
              //                     child: IconButton(
              //                       onPressed: () {
              //
              //                       },
              //                       icon:
              //
              //                            const Icon(Icons.favorite_border, color: Colors.white,),
              //                     ),
              //
              //
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   }),
              // )
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

class albumSong extends StatelessWidget {
  final dynamic song;

   albumSong({Key? key, this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List songAlbums = song_type_add_to_favorite;
    final provider = Provider.of<FavoriteProvider>(context);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: songAlbums.length,
      itemBuilder: (context, index) {
        final song = songAlbums[index];
        return GestureDetector(
          onTap: () {
           Navigator.of(context).push(createRoute(index));
          },
          child: ListTile(
            title: Text( "${index + 1} " + song,style: TextStyle(color: Colors.white),),
            trailing: IconButton(
              onPressed: () {
                provider.toggleFavorite(song);
              },
              icon: provider.isExist(song)
                  ? const Icon(
                Icons.favorite,
                color: Colors.red,
              )
                  : const Icon(Icons.favorite_border, color: Colors.white),
            ),


          ),

        );
      },
    );

  }
  
}

class AlbumPage2 extends StatelessWidget {

  const AlbumPage2({Key? key, required this.song, required this.songAlbumsMega}) : super(key: key);
  final List<Map<String, String>> song;
  final List songAlbumsMega;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List songAlbums = song;
    final provider = Provider.of<FavoriteMegaProvider>(context);
    return    Column(

      children: List.generate(songAlbums.length, (index) {
        final song = songAlbums[index];
        return Padding(
          padding:
          const EdgeInsets.only(right: 30, left: 30, bottom: 10),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  width: (size.width - 60) * 0.77,
                  child: Text(
                    "${index + 1} " + songAlbums[index]['title'],
                    style: TextStyle(color: white),
                  ),
                ),
                Container(
                  width: (size.width - 60) * 0.23,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        songAlbums[index]['duration'],
                        style: TextStyle(color: grey, fontSize: 14),
                      ),
                      Container(
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
                              : const Icon(Icons.favorite_border, color: Colors.white),
                        ),


                      ),
                      Container(
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
                              : const Icon(Icons.favorite_border, color: Colors.white),
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

    );}
}





