import 'package:flutter/material.dart';
import '../models/joke.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Joke> favoriteJokes;

  FavoritesScreen({required this.favoriteJokes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Jokes"),
      ),
      body: favoriteJokes.isEmpty
          ? Center(child: Text("No favorite jokes yet!"))
          : ListView.builder(
              itemCount: favoriteJokes.length,
              itemBuilder: (context, index) {
                final joke = favoriteJokes[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(joke.setup,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(joke.punchline),
                  ),
                );
              },
            ),
    );
  }
}
