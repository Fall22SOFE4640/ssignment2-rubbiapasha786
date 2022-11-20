import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
final Uri _url = Uri.parse('https://flutter.dev');

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          FavoriteWidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () async {
              final call = Uri.parse('tel:+1234567890');
              if (await canLaunchUrl(call)) {
                launchUrl(call);
              } else {
                throw 'Could not launch $call';
              }
            },
            child: const Text('Call'),
          ),
          ElevatedButton(
            onPressed: () async {
              final web = Uri.parse(
                'https://www.oeschinensee.ch/en/',
              );
              if (await canLaunchUrl(web)) {
                launchUrl(web);
              } else {
                throw 'Could not launch $web';
              }
            },
            child: const Text('Web'),
          ),
          ElevatedButton(
            onPressed: () async {
              final route = Uri.parse(
                'https://www.google.com/maps/dir/Switzerland/Oeschinen+Lake,+3718+Kandersteg,+Switzerland/@46.6766264,7.6602975,10z/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x478c64ef6f596d61:0x5c56b5110fcb7b15!2m2!1d8.227512!2d46.818188!1m5!1m1!1s0x478f08a670704edd:0x30815e0b3a5ce4ee!2m2!1d7.7291063!2d46.4989089',
              );
              if (await canLaunchUrl(route)) {
                launchUrl(route);
              } else {
                throw 'Could not launch $route';
              }
            },
            child: const Text('Route'),
          ),
          ElevatedButton(
            onPressed: () async {
              final share = Uri(
                scheme: 'mailto',
                path: 'oeschinensee.ch@gmail.com',
                query: 'subject=Share&body=https://goo.gl/maps/od7m1AwTxUTiCp227',
              );
              if (await canLaunchUrl(share)) {
                launchUrl(share);
              } else {
                throw 'Could not launch $share';
              }
            },
            child: const Text('Share'),
          ),
        ],
    ),
    );




    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text("Assignment 2"),
        ),
        body: ListView(children: [
          Image.asset('asset/images/lake.jpg.png',
              width: 600, height: 240, fit: BoxFit.cover),
          titleSection,
          buttonSection,
          textSection
        ]),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? const Icon(Icons.star) : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}

