import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart' show rootBundle;

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadJsonData(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> jsonData = json.decode(snapshot.data!);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Info'),
              backgroundColor: const Color.fromARGB(255, 216, 15, 1),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 270,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/grön_SPIIK_sköld.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jsonData['welcome']['title'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(jsonData['welcome']['text']),
                        const SizedBox(height: 16),
                        Text(
                          jsonData['whoWeAre']['title'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(jsonData['whoWeAre']['text']),
                        const SizedBox(height: 16),
                        Text(
                          jsonData['board']['title'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(jsonData['board']['text']),
                        TextButton(
                          onPressed: () {
                            launch(jsonData['board']['linkUrl']);
                          },
                          child: Text(
                            jsonData['board']['linkText'],
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          jsonData['board']['title'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(jsonData['introduction']['text']),
                        const SizedBox(height: 8),
                        Text(jsonData['membership']['text']),
                        TextButton(
                          onPressed: () {
                            launch(jsonData['membership']['linkUrl']);
                          },
                          child: Text(
                            jsonData['membership']['linkText'],
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading data'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<String> _loadJsonData() async {
    return await rootBundle.loadString('assets/data/info_page.json');
  }
}
