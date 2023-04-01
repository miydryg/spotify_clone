import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/theme/colors.dart';

import '../json/songs_json.dart';
import '../provider/favorite_provider.dart';

class MusicDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final Color color;
  final String img;
  final String songUrl;

  const MusicDetailPage(
      {Key? key,
      required this.title,
      required this.description,
      required this.color,
      required this.img,
      required this.songUrl})
      : super(key: key);

  @override
  State<MusicDetailPage> createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  double _currentSliderValue = 20;

  void changeSliderValue(value) {
    setState(() {
      _currentSliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), child: GetAppBar()),
      body: BodyWidget(
        img: widget.img,
        color: widget.color,
        title: widget.title,
        description: widget.description,
        sliderValue: _currentSliderValue,
        changeSlider: changeSliderValue,
      ),
    );
  }

  // Widget GetBody() {
  //   var size = MediaQuery.of(context).size;
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: [
  //         Stack(
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
  //               child: Container(
  //                 width: size.width - 60,
  //                 height: size.height - 360,
  //                 decoration: BoxDecoration(
  //                     image: DecorationImage(image: AssetImage(widget.img)),
  //                     borderRadius: BorderRadius.circular(20)),
  //               ),
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
}

class GetAppBar extends StatelessWidget {
  const GetAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: black,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: white,
            ))
      ],
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
    required this.img,
    required this.color,
    required this.title,
    required this.description,
    required this.sliderValue,
    required this.changeSlider,
  }) : super(key: key);

  final String img;
  final String title;
  final Color color;
  final String description;
  final double sliderValue;
  final void Function(double) changeSlider;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final provider = Provider.of<FavoriteProvider>(context);
    List songAlbums = song_type_add_to_favorite;
    return SingleChildScrollView(
      child: Column(children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Container(
                width: size.width - 100,
                height: size.height - 410,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: color,
                        blurRadius: 50,
                        spreadRadius: 5,
                        offset: const Offset(-10, 40))
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Container(
                width: size.width - 60,
                height: size.height - 360,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            width: size.width - 80,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Expanded(
                //
                //   child: ListView.builder(
                //     scrollDirection: Axis.vertical,
                //     shrinkWrap: true,
                //     itemCount: songAlbums.length,
                //     itemBuilder: (context, index) {
                //       final song = songs[index];
                //       return ListTile(
                //         title: Text(song, style: TextStyle(color: white),),
                //         trailing: IconButton(
                //           onPressed: () {
                //             provider.toggleFavorite(song);
                //           },
                //           icon: provider.isExist(song)
                //               ? const Icon(Icons.favorite, color: Colors.red,)
                //               : const Icon(Icons.favorite_border, color: white,),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                Icon(
                  Icons.add_box_outlined,
                  color: white,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 18,
                          color: white,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 150,
                      child: Text(
                        description,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: white.withOpacity(0.5),
                        ),
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.more_vert,
                  color: white,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Slider(
            value: sliderValue,
            activeColor: primary,
            min: 0,
            max: 200,
            onChanged: changeSlider),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1:50',
                style: TextStyle(color: white.withOpacity(0.5)),
              ),
              Text(
                '4:50',
                style: TextStyle(color: white.withOpacity(0.5)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon:  Icon (Icons.shuffle, color: white.withOpacity(0.5), size: 25,)),
              IconButton(onPressed: (){}, icon:  Icon (Icons.skip_previous, color: white.withOpacity(0.5), size: 25,)),
              IconButton (iconSize: 50,  icon: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: primary),
                child: Center(
                  child: Icon(Icons.stop, size: 28, color: white,),
                ),
              ) ,onPressed: (){},),

              IconButton(onPressed: (){}, icon:  Icon (Icons.skip_next, color: white.withOpacity(0.5), size: 25,)),
              IconButton(onPressed: (){}, icon:  Icon (Icons.repeat, color: white.withOpacity(0.5), size: 25,))


            ],
          ),
        ),

      ]),
    );
  }
}
