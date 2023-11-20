import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePageButton extends StatelessWidget {
  final String text;
  final String destination;

  const HomePageButton(
      {Key? key, required this.text, required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Colors.yellow,
      borderRadius: BorderRadius.circular(15),
      onPressed: () {
        Navigator.pushNamed(context, destination);
      },
      child: Container(
        width: 200,
        height: 25,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
