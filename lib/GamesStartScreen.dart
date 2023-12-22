import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:spiikify/screens/game_over_screen.dart';
import 'package:spiikify/screens/main_menu_screen.dart';
import 'package:spiikify/select_player_screen.dart';
import 'package:spiikify/game/flappy_bird_game.dart';

class CardGameStartScreen extends StatelessWidget {
  static const double imageSize = 150.0; // Define a constant for image size

  const CardGameStartScreen({Key? key}) : super(key: key);

  Widget buildBirdGameButton(BuildContext context) {
    return InkWell(
      onTap: () {
        final game = FlappyBirdGame();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameWidget(
              game: game,
              initialActiveOverlays: const [MainMenuScreen.id],
              overlayBuilderMap: {
                'mainMenu': (context, _) => MainMenuScreen(game: game),
                'gameOver': (context, _) => GameOverScreen(game: game),
              },
            ),
          ),
        );
      },
      child: Image.asset(
        'assets/images/spel_label.png',
        width: imageSize, // Use the constant for width
        height: imageSize, // Use the constant for height
      ),
    );
  }

  Widget buildCardGameButton(context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddPlayerScreen()),
          
        );
      },
      child: Image.asset(
        'assets/images/spel_label.png',
        width: imageSize, // Use the constant for width
        height: imageSize, // Use the constant for height
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 216, 15, 1),
        title: const Text('Spel'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/spel_bakgrund.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                buildCardGameButton(context),
                buildBirdGameButton(context),
                buildCardGameButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
