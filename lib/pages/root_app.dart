import 'package:flutter/material.dart';
import 'package:spotify_clone/pages/home_page.dart';
import 'package:spotify_clone/pages/my_playlist_page.dart';
import 'package:spotify_clone/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/provider/root_app_provider.dart';
import 'favorite.dart';

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: GetFooterBar(),
      body: const GetAppBar(),
    );
  }
}
  class GetAppBar extends StatelessWidget {
  const GetAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RootAppProvider>(context);
    final activeProviderTab = provider.activeTab;
    return IndexedStack(
      index: activeProviderTab,
      children: const [
      HomePage(),
        FavoritePage(),
        MyPlaylistPage(),
        Center(
          child: Text(
            'Setting',
            style: TextStyle(
                fontSize: 20, color: white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }


}

class GetFooterBar extends StatelessWidget {
   GetFooterBar({super.key});

  final List<IconData> items = [
    Icons.home,
    Icons.book,
    Icons.add_box_outlined,
    Icons.settings
  ];


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RootAppProvider>(context);
    final activeProviderTab = provider.activeTab;
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              items.length,
              (index) => IconButton(
                  onPressed: () {
                    Provider.of<RootAppProvider>(context,listen:false).menuActiveTap(index);
                  },
                  icon: Icon(
                    items[index],
                    color: activeProviderTab == index ? primary : white,
                  ))),
        ),
      ),
    );
  }
}
