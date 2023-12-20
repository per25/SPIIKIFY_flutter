import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class GameState extends ChangeNotifier {
  final List<String> _players = [];

  List<String> cards = [];
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
      print("loading decks");
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
      print("decks loaded");
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
  }

  void generateCards(List<String> selectedDecks) {
    cards = [];
    for (Deck deck in _selectedDecks) {
      for (GameCard card in deck.cards) {
        cards.add(card.name);
      }
    }
    cards.shuffle();
  }

  List<GameCard> getCards() {
    List<GameCard> cardsList = [];
    for (Deck deck in _selectedDecks) {
      for (GameCard card in deck.cards) {
        cardsList.add(GameCard(
          name: card.name,
          color: card.color,
          idNumber: card.idNumber,
          numberOfPlayers: card.numberOfPlayers,
          title: card.title,
          text: card.text,
        ));
      }
    }
    return cardsList;
  }

  int getCardsLength() {
    int cardsLength = 0;
    for (Deck deck in _selectedDecks) {
      cardsLength += deck.cards.length;
    }
    return cardsLength;
  }

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