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

    // Get the cards once and store them in a variable
    List<Widget> cards = gameState.getCards();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Swiper Screen'),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Swiper(
            itemCount: cards.length, // Use the length of cards
            itemBuilder: (BuildContext context, int index) {
              return cards[index]; // Use the cards variable here
            },
          ),
        ),
      ),
    );
  }
}
