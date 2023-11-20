import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaButtons extends StatelessWidget {
  final socialLinks = [
    {
      'url': 'https://www.facebook.com/SPIIK/?locale=sv_SE',
      'imageSource': 'assets/images/facebookLogo.png',
    },
    {
      'url': 'https://www.instagram.com/spiikkalmar/',
      'imageSource': 'assets/images/instagramLogo.png',
    },
    {
      'url': 'https://www.tiktok.com/sv-SE/',
      'imageSource': 'assets/images/tictocLogo.png',
    },
    {
      'url': 'https://www.discord.com',
      'imageSource': 'assets/images/discordLogo.png',
    },
    {
      'url': 'https://spiik.com',
      'imageSource': 'assets/images/webLogo.png',
    },
  ];

  Future<void> _handleLinkPress(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: socialLinks
            .map(
              (link) => GestureDetector(
                onTap: () => _handleLinkPress(link['url']!),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    link['imageSource'] as String,
                    width: 45,
                    height: 45,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
