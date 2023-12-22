import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class GameState extends ChangeNotifier {
  final List<String> _players = [];

  List<Widget> _cards = [];
  List<String> get players => _players;
  List<Deck> _decks = [];

  List<Deck> get decks => _decks;

  List<Deck> _selectedDecks = [];

  // Add a constructor to load the decks when the GameState is created.
  GameState() {
    scheduleMicrotask(loadDecks);
  }

  Future<void> loadDecks() async {
    try {
      final data = await rootBundle.loadString('assets/data/deck1.json');
      final jsonResult = jsonDecode(data);

      _decks = (jsonResult['decks'] as List).map((deckData) {
        final cards = (deckData['cards'] as List).map((cardData) {
          return GameCard(
            name: cardData['name'],
            color: cardData['color'],
            idNumber: cardData['idNumber'],
            numberOfPlayers: cardData['numberOfPlayers'],
            title: cardData['title'],
            text: cardData['text'],
          );
        }).toList();

        return Deck(
          name: deckData['name'],
          color: deckData['color'],
          type: deckData['type'],
          cards: cards,
        );
      }).toList();

      notifyListeners();
    } catch (e) {
      print("error loading decks: $e");
    }
  }

  void addPlayer(String name) {
    _players.add(name);
    notifyListeners();
  }

  void removePlayer(String name) {
    _players.remove(name);
    notifyListeners();
  }

  List<String> getDeckNames() {
    List<String> deckNames = _decks.map((deck) => deck.name).toList();
    print("printing the deck name list");
    deckNames.forEach((deckName) => print(deckName));
    return deckNames;
  }

  void setSelectedDecks(List<String> selectedDecksNames) {
    _selectedDecks =
        _decks.where((deck) => selectedDecksNames.contains(deck.name)).toList();
    generateCards(selectedDecksNames);  
  }

  void generateCards(List<String> selectedDecks) {
    _cards = [];
    int playerCounter = 0;
    for (Deck deck in _selectedDecks) {
      for (GameCard card in deck.cards) {
        _cards
            .add((buildCard(card, _players[playerCounter++ % _players.length])));
      }
    }
    _cards.shuffle();
  }

  int getCardsLength() {
    int cardsLength = 0;
    for (Deck deck in _selectedDecks) {
      cardsLength += deck.cards.length;
    }
    return cardsLength;
  }

  List<Widget> getCards() {
    return _cards;
  }
}

Widget buildCard(GameCard card, String playerName) {
  return Card(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Player: $playerName',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Name: ${card.name}',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Color: ${card.color}',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'ID Number: ${card.idNumber}',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Number of Players: ${card.numberOfPlayers}',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Title: ${card.title}',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Text: ${card.text}',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    ),
  );
}

class GameCard {
  final String name;
  final String color;
  final int idNumber;
  final int numberOfPlayers;
  final String title;
  final String text;

  GameCard({
    required this.name,
    required this.color,
    required this.idNumber,
    required this.numberOfPlayers,
    required this.title,
    required this.text,
  });
}

class Deck {
  final String name;
  final String color;
  final String type;
  final List<GameCard> cards;

  Deck({
    required this.name,
    required this.color,
    required this.type,
    required this.cards,
  });
}
