import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spiikify/game_state.dart';

class AddPlayerScreen extends StatefulWidget {
  const AddPlayerScreen({Key? key}) : super(key: key);

  @override
  _AddPlayerScreenState createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends State<AddPlayerScreen> {
  final TextEditingController _playerNameController = TextEditingController();

  void _handleAddPlayer() {
    String playerName = _playerNameController.text.trim();
    if (playerName.isNotEmpty) {
      Provider.of<GameState>(context, listen: false).addPlayer(playerName);
      _playerNameController.clear();
    }
  }

  void _handleRemovePlayer(String playerName) {
    Provider.of<GameState>(context, listen: false).removePlayer(playerName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 0, 32, 78),
              Color.fromARGB(255, 49, 57, 126)
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  'assets/images/spelare_label.png',
                  width: 0.7 * MediaQuery.of(context).size.width,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 80),
                      Row(
                        children: [
                          _buildTextField(),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: _handleAddPlayer,
                            child: Image.asset(
                              'assets/images/plus_knapp.png',
                              width: 30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          '< Byt spel',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Registrerade spelare',
                        style: TextStyle(
                          color: Color(0xFFFFF172),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildPlayerList(),
                      const SizedBox(height: 10),
                      _buildStarGameButton(context),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildTextField() {
    return Expanded(
      child: TextField(
        controller: _playerNameController,
        decoration: InputDecoration(
          hintText: 'Lägg till spelare?',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  Expanded _buildPlayerList() {
    return Expanded(
      child: Consumer<GameState>(
        builder: (context, gameState, child) {
          return ListView.builder(
            itemCount: gameState.players.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/profile_icon.png',
                      width: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      gameState.players[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        _handleRemovePlayer(gameState.players[index]);
                      },
                      child: const Text(
                        'X',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  ElevatedButton _buildStarGameButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'SelectDeckScreen');
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: const BorderSide(width: 3, color: Colors.black),
        ),
      ),
      child: const Text(
        'Starta spel',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
