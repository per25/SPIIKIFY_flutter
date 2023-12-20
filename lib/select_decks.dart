import 'package:flutter/material.dart';
import 'package:spiikify/card_game_swiper.dart';
import 'package:provider/provider.dart';
import 'package:spiikify/game_state.dart';

class SelectDeckScreen extends StatefulWidget {
  const SelectDeckScreen({Key? key}) : super(key: key);

  @override
  _SelectDeckScreenState createState() => _SelectDeckScreenState();
}

class _SelectDeckScreenState extends State<SelectDeckScreen> {
  late List<String> boxes;
  late List<bool> selectedBoxes;

  @override
  void initState() {
    super.initState();
    boxes = Provider.of<GameState>(context, listen: false).getDeckNames();
    selectedBoxes = List<bool>.generate(boxes.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < boxes.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: CheckboxListTile(
                  title: Text(
                    boxes[i],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: selectedBoxes[i],
                  onChanged: (value) {
                    setState(() {
                      selectedBoxes[i] = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: const Color.fromARGB(255, 243, 33, 33),
                  checkColor: Colors.white,
                  tileColor: Colors.transparent,
                ),
              ),
            ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                // Initialize an empty list of selected decks
                List<String> selectedDecks = [];

                // Iterate over the selectedBoxes list
                for (int i = 0; i < selectedBoxes.length; i++) {
                  // If the box is selected, add the corresponding deck to the selected decks list
                  if (selectedBoxes[i]) {
                    selectedDecks.add(boxes[i]);
                  }
                }

                // Use the Provider to get the GameState and call setSelectedDecks
                Provider.of<GameState>(context, listen: false)
                    .setSelectedDecks(selectedDecks);

                // Navigate to CardSwiperScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CardSwiperScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 231, 231, 231),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text('Start a Spell'),
            ),
          ),
        ],
      ),
    );
  }
}
