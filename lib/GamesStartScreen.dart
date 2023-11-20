import 'package:flutter/material.dart';
import 'package:spiikify/select_player_screen.dart';

class CardGameStartScreen extends StatelessWidget {
  static const double imageSize = 150.0; // Define a constant for image size

  const CardGameStartScreen({Key? key}) : super(key: key);

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
                InkWell(
                  onTap: () {
                    // Navigate to another screen when the image is clicked
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
                ),
                InkWell(
                  onTap: () {
                    // Navigate to AddPlayerScreen when the image is clicked
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
                ),
                InkWell(
                  onTap: () {
                    // Navigate to another screen when the image is clicked
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}