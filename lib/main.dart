import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'package:flutter_svg_icons/flutter_svg_icons.dart';

void main() {
  runApp(_Application());
}

class _Application extends StatelessWidget {
  const _Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Soraya'),
      home:
          //SafeArea(child:
          Scaffold(
        backgroundColor: Colors.blueGrey[300],
        appBar: _getAppbar(),
        body: _getMaincontext(),
      ),
      //),
    );
  }
}

PreferredSizeWidget _getAppbar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.grey[400],
    centerTitle: true,
    // ignore: prefer_const_constructors
    title: Text(
      'درباره محمدامین امیرکلایی اندی',
      textDirection: TextDirection.ltr,
      // ignore: prefer_const_constructors
      style: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _getMaincontext() {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5),
          _getCirclePhoto(),
          SizedBox(height: 10),
          _descriptopn(),
          SizedBox(height: 5),
          _getIcon(),
          SizedBox(height: 10),
          _getSkills(),
          SizedBox(height: 10),
          _getResume(),
          SizedBox(height: 10),
          _donate(),
        ],
      ),
    ),
  );
}

Widget _getCirclePhoto() {
  return Center(
    child: CircleAvatar(
      backgroundImage: AssetImage('image/profile.jpg'),
      radius: 130,
    ),
  );
}

Widget _descriptopn() {
  return Center(
    child: Column(
      children: [
        Text("سلام؛ من محمدامینم برنامه نویس جونیور فلاتر"),
        SizedBox(height: 5),
        Text("(((((; یک گیک واقعی"),
      ],
    ),
  );
}

Widget _getIcon() {
  var Icon_name = [
    'icons/github.png',
    'icons/gmail.png',
    'icons/linkedin.png',
    'icons/telegram.png',
    'icons/X.png',
    'icons/skype.png',
    'icons/spotify.png',
  ];
  var Call_icon = [
    'icons/sms.png',
    'icons/call.png',
  ];
  var Icon_link = [
    'https://github.com/MohammadAmin-Andy',
    'pg.mohammadamin@gmail.com',
    'https://www.linkedin.com/in/mohammad-amin-amirkolaei-andy-588448239/',
    'https://t.me/',
    'https://twitter.com/just_mamin',
    'https://join.skype.com/',
    'https://open.spotify.com/user/31nzb5buqmpfyxtcusyqvajoxunu'
  ];
  var Call_link = [
    'sms:+98936****878',
    'tel:+98936****878',
  ];
  return Wrap(
    alignment: WrapAlignment.center,
    children: [
      for (var i = 0; i < Icon_name.length; i++)
        IconButton(
          onPressed: () async {
            //const url = Icon_link[i];
            await launch(Icon_link[i]);
          },
          icon: Image.asset(
            Icon_name[i],
            height: 30,
            width: 30,
          ),
        ),
      for (var i = 0; i < Call_icon.length; i++)
        IconButton(
          onPressed: () {
            Uri uri = Uri.parse(Call_link[i]);
            launchUrl(uri);
          },
          icon: Image.asset(
            Call_icon[i],
            height: 30,
            width: 30,
          ),
        )
    ],
  );
}

Widget _getSkills() {
  var skill_list = ['Dart', 'Flutter', 'Git'];
  return Wrap(
    children: [
      for (var skill in skill_list)
        Card(
          elevation: 10,
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  'image/$skill.png',
                  height: 110,
                  width: 110,
                ),
              ),
              Text('$skill')
            ],
          ),
        ),
    ],
  );
}

Widget _getResume() {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    width: double.infinity,
    color: Colors.blueGrey[100],
    child: Column(
      children: [
        Text(
          ':درباره من',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        _getHistory(),
      ],
    ),
  );
}

Widget _getHistory() {
  var list = [
    'دانشجوی مهندسی کامپیوتر',
    'python, C, C++ تسلط نسبی به زبان های',
    'در حال یادگیری دوره فلاتر با استاد امیراحمدادیبی'
  ];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      SizedBox(height: 20),
      for (var history in list)
        Text(
          history,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            height: 2,
          ),
        ),
    ],
  );
}

Widget _donate() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      TextButton(
        onPressed: () {
          Uri uri = Uri.parse(
              'https://github.com/MohammadAmin-Andy/portfolio---remake');
          launchUrl(uri);
          // Handle button press
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(16.0), // Set padding around the button
        ),
        child: Column(
          children: [
            Image.asset(
              'icons/star.png',
              height: 40,
            ),
            SizedBox(height: 8), // Add some space between the image and text
            Text(
              'Star to this project :)',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      TextButton(
        onPressed: () {
          Uri uri = Uri.parse('http://www.coffeete.ir/Mamin');
          launchUrl(uri);
          // Handle button press
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(16.0), // Set padding around the button
        ),
        child: Column(
          children: [
            Image.asset(
              'icons/donate.png',
              height: 40,
            ),
            SizedBox(height: 8), // Add some space between the image and text
            Text(
              'Donation',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ],
  );
}
