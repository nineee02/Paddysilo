import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:paddy_app/constants/color.dart';

@RoutePage()
class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  homeRouteState createState() => homeRouteState();
}

class homeRouteState extends State<HomeRoute> {
  bool _obscuretext = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: main_color,
      appBar: AppBar(
        backgroundColor: main_color,
        title: Text(
          "Silo",
          style: TextStyle(
              color: front_color, fontSize: 32, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () => context.router.replaceNamed('/notification'),
            icon: Icon(Icons.notifications_active),
          ),
          PopupMenuButton<String>(
            onSelected: (String result) {
              switch (result) {
                case 'Add':
                  context.router.replaceNamed('/adddevice');
                case 'Scan':
                  context.router.replaceNamed('/addscan');
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Add',
                child: Text('Add device'),
              ),
              const PopupMenuItem<String>(
                value: 'Scan',
                child: Text('Scan'),
              ),
            ],
            icon: Icon(Icons.add_circle), // ไอคอนเมนูตัวเลือก
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }

  Widget homeTextField(TextEditingController controller, String labelText,
      IconData perfixIcon, IconData SuffixIcon) {
    return Container(
      height: 48,
      width: 312,
      child: TextField(
          controller: controller,
          obscureText: labelText == 'password' && _obscuretext,
          decoration: InputDecoration(
              filled: true,
              fillColor: backtext_color,
              contentPadding: EdgeInsets.symmetric(
                  vertical: 12, horizontal: 10), //การขยับซ้ายขวา
              prefixIcon: Icon(perfixIcon, color: icon_color),
              suffixIcon: IconButton(
                icon: Icon(
                  SuffixIcon,
                  color: icon_color,
                ),
                onPressed: () {
                  if (labelText == 'password') {
                    setState(() {
                      _obscuretext = !_obscuretext;
                    });
                  } else {
                    controller.clear();
                  }
                },
              ),
              labelText: labelText,
              labelStyle: TextStyle(color: suf_front_color, fontSize: 16),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: backtext_color, width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: focus_color, width: 1)))),
    );
  }
}
