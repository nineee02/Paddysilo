import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paddy_app/constants/color.dart';
// import 'package:paddy_app/router/router.gr.dart';

@RoutePage()
class LoginRoute extends StatefulWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  _loginRouteState createState() => _loginRouteState();
}

class _loginRouteState extends State<LoginRoute> {
  bool _obscuretext = true;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: main_color,
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //กำหนดบล็อกว่าอยู่ตรงไหน(กลาง)
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                color: front_color,
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "      Paddy Rice Drying Silo\n Control Notification System",
              style: TextStyle(
                color: front_color,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              //ระยะห่าง
              height: 16,
            ),
            Image.asset(
              'lib/assets/image/1.png',
              height: 214,
              width: 214,
            ),
            SizedBox(
              height: 16,
            ),
            loginTextField(emailcontroller, 'Email', Icons.person, Icons.clear),
            SizedBox(
              height: 16,
            ),
            loginTextField(passwordcontroller, 'password', Icons.lock,
                _obscuretext ? Icons.visibility : Icons.visibility_off),
            // SizedBox(
            //   height: 4,
            // ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 48),
                child: TextButton(
                  onPressed: () => context.router.replaceNamed('/forgot'),
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(color: suf_front_color, fontSize: 10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  //ข้อความปุ่มกด
                  backgroundColor: back_Button_color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)), //ความมนของกรอบ
                  minimumSize: Size(312, 48)),
              onPressed: () => context.router.replaceNamed('/home'),
              child: Text("Sign in",
                  style: TextStyle(
                    color: front_color,
                    fontSize: 18,
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "_______________________________________________",
              style: TextStyle(
                color: suf_front_color,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 48),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(
                          color: suf_front_color,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: () => context.router.replaceNamed('/sign_up'),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: front_color,
                            decoration: TextDecoration.underline,
                            fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginTextField(TextEditingController controller, String labelText,
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
