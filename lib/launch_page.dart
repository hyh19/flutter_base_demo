import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

///如何打开第三方应用？
class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('如何打开第三方应用？'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _launchURL(),
              child: const Text('打开浏览器'),
            ),
            ElevatedButton(
              onPressed: () => _openMap(),
              child: const Text('打开地图'),
            )
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    final url = Uri.parse('http://www.devio.org/');
    if (await canLaunchUrl(url)) {
      // canLaunch已过时改为canLaunchUrl
      await launchUrl(url); // launch已过时，改为launchUrl
    } else {
      throw 'Could not launch $url';
    }
  }

  _openMap() async {
    // Android
    final url = Uri.parse('geo:52.32,4.917'); //APP提供者提供的 schema
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      //iOS
      final url = Uri.parse('http://maps.apple.com/?ll=52.32,4.917');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
