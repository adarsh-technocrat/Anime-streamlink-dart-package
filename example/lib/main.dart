import 'package:anime_streamlink/anime_streamlink.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Streamlink Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Anime Streamlink',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            Text(
              value,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.blue, padding: const EdgeInsets.all(20)),
        onPressed: () {
          // [passing embeded Video URL Argument]
          getAnimeStreamlink("https://gogoanime-tv.pro/embed/JuAP9")
              .then((streamLink) {
            debugPrint(streamLink);
            setState(() {
              value = streamLink;
            });
          });
        },
        child: const Text(
          'Get Streamlink',
          style: TextStyle(color: Colors.white),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
