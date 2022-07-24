import 'package:flutter/material.dart';
import 'package:flutter_gatos_viewer/app/providers/cat_provider.dart';
import 'package:flutter_gatos_viewer/app/widgets/cat_watcher.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CatProvider>(create: (context) => CatProvider()),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const IntroWidget(),
          '/viewer': (context) => const CatViewer(),
        },
      ),
    );
  }
}

class IntroWidget extends StatelessWidget {
  const IntroWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gatos Watcher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/gato3Blue.gif'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/viewer');
              },
              child: const Text('Watchear ;)'),
            )
          ],
        ),
      ),
    );
  }
}
