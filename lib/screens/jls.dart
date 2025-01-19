import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../widgets/jokecard.dart';
import './fj.dart';

class JokeListScreen extends StatefulWidget {
  final String type;

  JokeListScreen({required this.type});

  @override
  _JokeListScreenState createState() => _JokeListScreenState();
}

class _JokeListScreenState extends State<JokeListScreen> {
  List<Joke> jokes = [];
  List<Joke> favoriteJokes = [];

  void toggleFavorite(Joke joke) {
    setState(() {
      if (joke.isFavorite) {
        favoriteJokes.add(joke);
      } else {
        favoriteJokes.removeWhere((j) => j.id == joke.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.type} Jokes"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoritesScreen(favoriteJokes: favoriteJokes),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: jokes
            .map((joke) =>
                JokeCard(joke: joke, onFavoriteToggle: toggleFavorite))
            .toList(),
      ),
    );
  }
}
