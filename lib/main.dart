import 'package:flutter/material.dart';
import 'package:spotify_clone/pages/root_app.dart';
import 'package:provider/provider.dart';

import 'package:spotify_clone/provider/root_app_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: RootAppProvider()),

        ],
        child: const MaterialApp(
          home: RootApp(),
        )
    );
  }
}
