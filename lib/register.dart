import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tendollar_app/login.dart';
import 'package:tendollar_app/register.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confrimPasswordEditingController =
      TextEditingController();

  bool isObcure = true;
  bool cisObcure = true;

  var formStateKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Form(
            key: formStateKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image(
                    image: AssetImage("assets/images/login_illustration.png"),
                  ),
                ),
                Text(
                  "Sign Up for 10dollar ",
                  style: TextStyle(fontFamily: "Kreon", fontSize: 30),
                ),
                Text(
                  "Join the vibrant music community and unlock exciting opportunities!",
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
                TextFormField(
                  controller: emailEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required, please enter your email";
                    } else if (!(value.contains('@') && value.contains(".")) ||
                        value.length <= 6) {
                      return "Enter valid email";
                    }
                    return null;
                  },
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
                TextFormField(
                  controller: passwordEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required , Please enter you password";
                    } else if (value.length < 6) {
                      return "Password must be greater than six";
                    } else {
                      return null;
                    }
                  },
                  obscureText: isObcure,
                  decoration: InputDecoration(
                    fillColor: Color(0xffd9d9d9),
                    filled: true,
                    hintText: "Enter your password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isObcure = !isObcure;
                        });
                      },
                      child: Icon(
                        isObcure ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Confirm Password",
                  style: TextStyle(
                    fontFamily: "Kreon",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: confrimPasswordEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confrim password is required , please enter it";
                    } else if (value != passwordEditingController.text) {
                      return "Confrim your password";
                    } else {
                      return null;
                    }
                  },
                  obscureText: cisObcure,
                  decoration: InputDecoration(
                    fillColor: Color(0xffd9d9d9),
                    filled: true,
                    hintText: "*************",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          cisObcure = !cisObcure;
                        });
                      },
                      child: Icon(
                        cisObcure ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    formStateKey.currentState?.validate();
                  },
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
                      text: "Already have an account? ",
                      style: TextStyle(
                        fontFamily: "Kreon",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: " Sign In",
                          style: TextStyle(color: Color(0xff7df9ff)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
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
        ),
      ),
    );
  }
}
