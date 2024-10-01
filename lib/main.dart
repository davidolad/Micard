import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFEDE574),
                  Color(0xFFE1F5C4),
                  Color(0xFF6BC1FF),
                  Color(0xFF1C92D2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('images/luciano.JPEG'),
                ),
                Text(
                  'Davey Luciano',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontFamily: 'Source Code Pro',
                    fontSize: 15.0,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'Webflow Developer',
                  style: TextStyle(
                    fontFamily: 'Source Code Pro',
                    fontSize: 15.0,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 200.0,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                buildInfoRow(Icons.phone, '+234 903 737 8315'),
                buildInfoRow(Icons.email, 'davidolad@gmail.com'),
                buildInfoRow(Icons.snapchat, 'luciano'),
                buildInfoRow(Icons.telegram, '+234 903 737 8315'),
                buildInfoRow(Icons.facebook, 'David Lade'),
                buildInfoRow(Icons.tiktok, 'davey_luciano'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String text) {
    return HoverCard(
      icon: icon,
      text: text,
    );
  }
}

class HoverCard extends StatefulWidget {
  final IconData icon;
  final String text;

  HoverCard({required this.icon, required this.text});

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
        Future.delayed(Duration(milliseconds: 200), () {
          setState(() {
            _isPressed = !_isPressed;
          });
        });
      },
      onHover: (hovering) {
        setState(() {
          _isHovered = hovering;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: _isPressed ? Colors.blue.shade100 : Colors.white,
          boxShadow: _isHovered
              ? [BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(0, 5))]
              : [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5, offset: Offset(0, 3))],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                fontFamily: 'Source Code Pro',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
