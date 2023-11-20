import 'package:flutter/material.dart';
import 'package:spiikify/card_game_swiper.dart';

class SelectDeckScreen extends StatefulWidget {
  const SelectDeckScreen({Key? key}) : super(key: key);

  @override
  _SelectDeckScreenState createState() => _SelectDeckScreenState();
}

class _SelectDeckScreenState extends State<SelectDeckScreen> {
  List<String> boxes = [
    'Jag har aldrig...',
    'Pek leken',
    'Box 3',
    'Box 4',
    'Box 5'
  ];
  List<bool> selectedBoxes = List<bool>.generate(5, (index) => false);

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
                    style: TextStyle(
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
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the next screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NextScreen(selectedBoxes: selectedBoxes)),
                );
              },
              child: const Text('Start a Spell'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 231, 231, 231),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  final List<bool> selectedBoxes;

  const NextScreen({Key? key, required this.selectedBoxes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Screen'),
      ),
      body: ListView.builder(
        itemCount: selectedBoxes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Box ${index + 1}'),
            subtitle: Text(selectedBoxes[index] ? 'Selected' : 'Not Selected'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CardSwiperScreen()),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
