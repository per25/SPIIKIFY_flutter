import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class CardSwiperScreen extends StatelessWidget {
  const CardSwiperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Swiper Screen'),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height, // Update the height to match the screen height
          child: Swiper(
            itemCount: 300,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Center(
                  child: Text(
                    'Card ${index + 1}',
                    style: TextStyle(fontSize: 24),
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