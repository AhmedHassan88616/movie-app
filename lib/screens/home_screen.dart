import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/widgets/genres_screen.dart';
import 'package:movies_app/widgets/now_playing.dart';
import 'package:movies_app/widgets/persons_list.dart';
import 'package:movies_app/widgets/top_movies.dart';
import '../style/theme.dart' as style;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: style.Colors.mainColor,
        centerTitle: true,
        leading: Icon(
          EvaIcons.menu2Outline,
          color: Colors.white,
        ),
        title: Text("Movies App"),
        actions: [
          IconButton(
            icon: Icon(
              EvaIcons.search,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: ListView(
        children: [
          NowPlaying(),
          GenresScreen(),
          PersonsList(),
          TopMovies(),
        ],
      ),
    );
  }
}
