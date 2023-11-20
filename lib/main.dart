import 'package:flutter/material.dart';
import 'package:spiikify/GamesStartScreen.dart';
import 'package:spiikify/card_game_swiper.dart';
import 'package:spiikify/event_screen.dart';
import 'package:spiikify/home_page_buttons.dart';
import 'package:spiikify/select_decks.dart';
import 'package:spiikify/select_player_screen.dart';
import 'package:spiikify/social_media_buttons.dart';
import 'package:spiikify/info_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 230, 8, 8)),
        useMaterial3: true,
      ),
      routes: {
        'CardGameStartScreen': (context) => const CardGameStartScreen(),
        'InfoScreen': (context) => const InfoScreen(),
        'EventScreen': (context) => const EventScreen(),
        'AddPlayerScreen': (context) => const AddPlayerScreen(),
        'SelectDeckScreen': (context) => const SelectDeckScreen(),
        'CardSwiperScreen':(context) => const CardSwiperScreen(),
      },
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 15, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 216, 15, 1),
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10), // Add margin to the image
            width: 300, // Set the width of the image
            height: 350, // Set the height of the image
            child: Image.asset('assets/images/svart_SPIIK_sköld.png'),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.all(10), // Add margin to the buttons
            child: const HomePageButton(
              text: 'Spel',
              destination: 'CardGameStartScreen',
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10), // Add margin to the buttons
            child: const HomePageButton(
              text: 'Event',
              destination: 'EventScreen',
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10), // Add margin to the buttons
            child: const HomePageButton(
              text: 'Info',
              destination: 'InfoScreen',
            ),
          ),
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.all(
                10), // Add margin to the social media buttons
            child: SocialMediaButtons(),
          ),
        ],
      ),
    );
  }
}
