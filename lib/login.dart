import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tendollar_app/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                image: AssetImage("assets/images/login_illustration.png"),
              ),
            ),
            Text(
              "Welcome Back  ",
              style: TextStyle(fontFamily: "Kreon", fontSize: 30),
            ),
            Text(
              "Sign in to access your account and explore \nthe world of music!",
              style: TextStyle(
                fontFamily: "Kreon",
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Email",
              style: TextStyle(
                fontFamily: "Kreon",
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffD9d9d9),
                hintStyle: TextStyle(
                  fontFamily: "Kreon",
                  fontWeight: FontWeight.w700,
                ),
                hintText: "exalmple@gmail.com",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Password",
              style: TextStyle(
                fontFamily: "Kreon",
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                fillColor: Color(0xffd9d9d9),
                filled: true,
                hintText: "*************",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Forget password",
                style: TextStyle(
                  fontFamily: "Kreon",
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff7DF9FF),
                ),
              ),
            ),

            SizedBox(height: 30),
            GestureDetector(
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff7df9ff),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(fontFamily: "Kreon", fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(
                    fontFamily: "Kreon",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: " Sign Up",
                      style: TextStyle(color: Color(0xff7df9ff)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
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
}
