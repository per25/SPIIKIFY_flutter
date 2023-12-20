import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:spiikify/game_state.dart';

class CardSwiperScreen extends StatelessWidget {
  const CardSwiperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Provider to get the GameState
    GameState gameState = Provider.of<GameState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Swiper Screen'),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context)
              .size
              .height, 
          child: Swiper(
            itemCount: gameState
                .getCards().length, // Use getCards() method to get the length
            itemBuilder: (BuildContext context, int index) {
              GameCard card = gameState.getCards()[index]; // Use getCards() method to get the card at index

              return Card(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
            },
          ),
        ),
      ),
    );
  }
}