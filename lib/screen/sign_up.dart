import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:paddy_app/constants/color.dart';

@RoutePage()
class SignUpRoute extends StatefulWidget {
  const SignUpRoute({super.key});

  @override
  _sign_upRouteState createState() => _sign_upRouteState();
}

class _sign_upRouteState extends State<SignUpRoute> {
  bool _obscuretext = true;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController surnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: main_color,
      appBar: AppBar(
        backgroundColor: main_color,
        leading: (IconButton(
          onPressed: () => context.router.replaceNamed('/login'),
          icon: Icon(Icons.arrow_back),
        )),
        title: Text("Create Account",
            style: TextStyle(
                color: focus_color, fontSize: 20, fontWeight: FontWeight.w600)),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            sign_upTextField(namecontroller, 'Name', Icons.person, Icons.clear),
            SizedBox(
              height: 16,
            ),
            sign_upTextField(
                surnamecontroller, 'Surname', Icons.person, Icons.clear),
            SizedBox(
              height: 16,
            ),
            sign_upTextField(emailcontroller, 'Enter email address',
                Icons.email, Icons.clear),
            SizedBox(
              height: 16,
            ),
            sign_upTextField(phonenumbercontroller, 'Enter phone number',
                Icons.phone, Icons.clear),
            SizedBox(
              height: 16,
            ),
            sign_upTextField(
                passwordcontroller, 'Enter password', Icons.lock, Icons.clear),
            SizedBox(
              height: 16,
            ),
            sign_upTextField(confirmcontroller, 'Confirm your password',
                Icons.lock, Icons.clear),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: back_Button_color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  minimumSize: Size(312, 48)),
              onPressed: () => context.router.replaceNamed('/login'),
              child: Text(
                "Sign up",
                style: TextStyle(color: focus_color, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget sign_upTextField(TextEditingController controller, String labelText,
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
