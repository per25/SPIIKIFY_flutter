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
          height: MediaQuery.of(context).size.height,
          child: Swiper(
              itemCount: gameState
                  .getCards()
                  .length, // Use getCards() method to get the length
              itemBuilder: (BuildContext context, int index) {
                return gameState.getCards()[index];
              }),
        ),
      ),
    );
  }
}
