import 'package:flutter/material.dart';
import 'package:spotify_clone/json/songs_json.dart';
import 'package:spotify_clone/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int activeMenu = 0;

  void menuTap(int index) {
    setState(() {
      activeMenu = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), child: getAppBar()),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: black,
      elevation: 0,
      title: const Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Explore',
              style: TextStyle(
                  fontSize: 20, color: white, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.list)
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                      children: List.generate(song_type_1.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: GestureDetector(
                        onTap: (){
                          menuTap(index);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song_type_1[index],
                              style:  TextStyle(
                                  fontSize: 15,
                                  color: activeMenu == index ? primary : white,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 3,),
                          activeMenu == index ?   Container(
                              width: 10,
                              height: 3,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(5))
                          ) : Container()
                          ],
                        ),
                      ),
                    );
                  })),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
