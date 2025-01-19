import 'package:flutter/material.dart';
import '../models/joke.dart';

class JokeCard extends StatefulWidget {
  final Joke joke;
  final Function(Joke) onFavoriteToggle;

  JokeCard({required this.joke, required this.onFavoriteToggle});

  @override
  _JokeCardState createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(widget.joke.setup,
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(widget.joke.punchline),
        trailing: IconButton(
          icon: Icon(
            widget.joke.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: widget.joke.isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              widget.joke.isFavorite = !widget.joke.isFavorite;
            });
            widget.onFavoriteToggle(widget.joke);
          },
        ),
      ),
    );
  }
}
