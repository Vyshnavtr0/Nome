import 'dart:async';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _LoginPageState extends State<LoginPage> {
  final navLinks = ["Home", "My Notes", "Sell Notes", "Contact"];
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();
  final name_controller = TextEditingController();

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.success();
    });
  }

  bool login = false;
  bool passvis = false;
  bool register = false;
  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: EdgeInsets.only(left: 30),
        child: Text(text,
            style: TextStyle(
                fontFamily: "Montserrat-Bold", fontWeight: FontWeight.w400)),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/main_top.png",
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              "assets/images/main_bottom.png",
            ),
          ),
          Positioned(
            top: 100,
            left: 100,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.indigo.shade100,
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
          Positioned(
            left: 700,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
          Positioned(
            top: 500,
            left: 500,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(500)),
            ),
          ),
          Positioned(
            bottom: 200,
            right: 200,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.indigo.shade100,
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
          GlassContainer(
            //height: MediaQuery.of(context).size.height,
            blur: 6,
            color: Colors.white.withOpacity(0.1),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.blue.withOpacity(0.3),
              ],
            ),
            //--code to remove border
            border: Border.fromBorderSide(BorderSide.none),
            shadowStrength: 5,
            shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(16),
            shadowColor: Colors.white.withOpacity(0.24),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFC86DD7),
                                      Color(0xFF3023AE),
                                    ],
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft)),
                            child: Center(
                              child: Text("N",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text("NoMe", style: TextStyle(fontSize: 16))
                        ],
                      ),
                      if (MediaQuery.of(context).size.width > 850)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[...navItem()]..add(InkWell(
                              onTap: () {
                                if (login == true) {
                                  setState(() {
                                    login = false;
                                    register = true;
                                  });
                                } else {
                                  setState(() {
                                    login = true;
                                    register = false;
                                  });
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 40),
                                width: 120,
                                height: 40,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFC86DD7),
                                          Color(0xFF3023AE)
                                        ],
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color(0xFF6078ea).withOpacity(.3),
                                          offset: Offset(0, 8),
                                          blurRadius: 8)
                                    ]),
                                child: Material(
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Text(
                                        login != true ? "Login" : "Register",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            letterSpacing: 1,
                                            fontFamily: "Montserrat-Bold")),
                                  ),
                                ),
                              ))),
                        )
                      else
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.segment,
                            size: 30,
                          ),
                        )

                      // Image.network("assets/images/menu.png",
                      // width: 26, height: 26)
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.1,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            DelayedDisplay(
                              delay: Duration(milliseconds: 100),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerRight,
                                widthFactor: .4,
                                child: MediaQuery.of(context).size.width > 850
                                    ? Image.network(
                                        "assets/images/illustration-1.png",
                                        scale: .3)
                                    : SizedBox(),
                              ),
                            ),
                            FractionallySizedBox(
                              alignment: MediaQuery.of(context).size.width > 850
                                  ? Alignment.centerLeft
                                  : Alignment.center,
                              widthFactor:
                                  MediaQuery.of(context).size.width > 850
                                      ? .6
                                      : 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: login == true
                                    ? loginmeth(context)
                                    : register == true
                                        ? registermeth(context)
                                        : welcome(context),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding registermeth(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width < 850
              ? MediaQuery.of(context).size.width / 15
              : MediaQuery.of(context).size.width / 8,
          vertical: MediaQuery.of(context).size.width < 850
              ? MediaQuery.of(context).size.height / 90
              : MediaQuery.of(context).size.height / 6),
      child: SizedBox(
        child: Column(
          children: [
            DelayedDisplay(
              delay: Duration(milliseconds: 200),
              child: Visibility(
                visible: MediaQuery.of(context).size.width < 850 ? true : false,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.network("assets/images/illustration-2.png",
                      scale: .10),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: 200),
              child: TextField(
                controller: name_controller,
                enableSuggestions: true,
                decoration: InputDecoration(
                  hintText: 'Enter Your Name ',
                  filled: true,
                  fillColor: Colors.blueGrey[50],
                  labelStyle: TextStyle(fontSize: 12),
                  contentPadding: EdgeInsets.only(left: 30),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            DelayedDisplay(
              delay: Duration(milliseconds: 200),
              child: TextField(
                controller: email_controller,
                enableSuggestions: true,
                decoration: InputDecoration(
                  hintText: 'Enter email ',
                  filled: true,
                  fillColor: Colors.blueGrey[50],
                  labelStyle: TextStyle(fontSize: 12),
                  contentPadding: EdgeInsets.only(left: 30),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            DelayedDisplay(
              delay: Duration(milliseconds: 200),
              child: Flexible(
                child: Column(
                  children: [
                    TextField(
                      controller: password_controller,
                      obscureText: passvis,
                      decoration: InputDecoration(
                        hintText: 'Password',

                        // counterText: 'Forgot password?',

                        suffixIcon: IconButton(
                          onPressed: (() {
                            setState(() {
                              passvis = !passvis;
                            });
                          }),
                          icon: passvis == true
                              ? Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                )
                              : Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.grey,
                                ),
                        ),
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        labelStyle: TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.only(left: 30),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    // SizedBox(height: 5),
                    /*FlutterPwValidator(
                    controller: password_controller,

                    minLength: 6,
                    strings: FlutterPwValidatorStrings(),
                    //uppercaseCharCount: 1,
                    //numericCharCount: 1,
                    //specialCharCount: 1,
                    width:
                        MediaQuery.of(context).size.width < 600 ? 300 : 400,
                    height: MediaQuery.of(context).size.width < 600 ? 40 : 40,
                    onSuccess: () {
                      print("Matched");
                    },
                  ),*/
                  ],
                ),
              ),
            ),
            //SizedBox(height: 0),
            SizedBox(height: 20),
            DelayedDisplay(
                delay: Duration(milliseconds: 300),
                child: RoundedLoadingButton(
                  child:
                      Text('Register', style: TextStyle(color: Colors.white)),
                  controller: _btnController,
                  color: Colors.deepPurple,
                  animateOnTap: false,
                  borderRadius: 14,
                  width: double.infinity,
                  height: 54,
                  elevation: 1,
                  successColor: Colors.green,
                  onPressed: () async {
                    if (email_controller.text.isNotEmpty == true) {
                      if (validator.email(email_controller.text) == true) {
                        if (password_controller.text.isNotEmpty == true) {
                          _btnController.start();
                          await auth
                              .createUserWithEmailAndPassword(
                                  email: email_controller.text,
                                  password: password_controller.text)
                              .then((uid) => {_btnController2.success()})
                              .catchError((e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: notify(
                                clr: Color(0xFFC72C41),
                                clr2: Color(0xFF801336),
                                icon: Icons.close,
                                msg: e.msg.toString(),
                                title: "Somthing went wrong !",
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ));
                          });
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: notify(
                            clr: Color(0xFFC72C41),
                            clr2: Color(0xFF801336),
                            icon: Icons.close,
                            msg:
                                "Change a few things up and try submitting again",
                            title: "Invaid Email !",
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ));
                      }
                    } else {
                      //_btnController.reset();
                    }
                  },
                ) /*Container(
                                            decoration: BoxDecoration(
                                              color: Colors.deepPurple,
                                              borderRadius: BorderRadius.circular(30),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(255, 190, 163, 227),
                                                  spreadRadius: 10,
                                                  blurRadius: 20,
                                                ),
                                              ],
                                            ),
                                            child: ElevatedButton(
                                            child: Container(
                                                width: double.infinity,
                                                height: 50,
                                                child: Center(child: Text("Sign In"))),
                                            onPressed: () => print("it's pressed"),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.deepPurple,
                                              onPrimary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                            ),*/
                ),
            SizedBox(height: 20),
            DelayedDisplay(
              delay: Duration(milliseconds: 400),
              child: Row(children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey[300],
                    height: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Or continue with"),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey[400],
                    height: 50,
                  ),
                ),
              ]),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DelayedDisplay(
                    delay: Duration(milliseconds: 400),
                    child: _loginWithButton(
                        context: context, image: 'images/google.png')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding loginmeth(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width < 850
              ? MediaQuery.of(context).size.width / 15
              : MediaQuery.of(context).size.width / 8,
          vertical: MediaQuery.of(context).size.width < 850
              ? MediaQuery.of(context).size.height / 90
              : MediaQuery.of(context).size.height / 6),
      child: SizedBox(
        child: Column(
          children: [
            DelayedDisplay(
              delay: Duration(milliseconds: 200),
              child: Visibility(
                visible: MediaQuery.of(context).size.width < 850 ? true : false,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.network("assets/images/illustration-2.png",
                      scale: .10),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: 200),
              child: TextField(
                controller: email_controller,
                enableSuggestions: true,
                decoration: InputDecoration(
                  hintText: 'Enter email ',
                  filled: true,
                  fillColor: Colors.blueGrey[50],
                  labelStyle: TextStyle(fontSize: 12),
                  contentPadding: EdgeInsets.only(left: 30),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            DelayedDisplay(
              delay: Duration(milliseconds: 200),
              child: Flexible(
                child: Column(
                  children: [
                    TextField(
                      controller: password_controller,
                      obscureText: passvis,
                      decoration: InputDecoration(
                        hintText: 'Password',

                        // counterText: 'Forgot password?',

                        suffixIcon: IconButton(
                          onPressed: (() {
                            setState(() {
                              passvis = !passvis;
                            });
                          }),
                          icon: passvis == true
                              ? Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                )
                              : Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.grey,
                                ),
                        ),
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        labelStyle: TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.only(left: 30),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    /*FlutterPwValidator(
                      controller: password_controller,

                      minLength: 6,
                      strings: FlutterPwValidatorStrings(),
                      //uppercaseCharCount: 1,
                      //numericCharCount: 1,
                      //specialCharCount: 1,
                      width:
                          MediaQuery.of(context).size.width < 600 ? 300 : 400,
                      height: MediaQuery.of(context).size.width < 600 ? 40 : 40,
                      onSuccess: () {
                        print("Matched");
                      },
                    ),*/
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            DelayedDisplay(
              delay: Duration(milliseconds: 300),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      // print(MediaQuery.of(context).size.width);
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            DelayedDisplay(
                delay: Duration(milliseconds: 300),
                child: RoundedLoadingButton(
                  child: Text('Sign In', style: TextStyle(color: Colors.white)),
                  controller: _btnController,
                  color: Colors.deepPurple,
                  animateOnTap: false,
                  borderRadius: 14,
                  width: double.infinity,
                  height: 54,
                  elevation: 1,
                  successColor: Colors.green,
                  onPressed: () async {
                    if (email_controller.text.isNotEmpty == true) {
                      if (validator.email(email_controller.text) == true) {
                        if (password_controller.text.isNotEmpty == true) {
                          _btnController.start();
                          await auth
                              .signInWithEmailAndPassword(
                                  email: email_controller.text,
                                  password: password_controller.text)
                              .then((uid) => {_btnController.success()})
                              .catchError((e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: notify(
                                clr: Color(0xFFef8d32),
                                clr2: Color(0xFFcc561e),
                                icon: Icons.close,
                                msg: e.msg.toString(),
                                title: "Warning!",
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ));
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: notify(
                              clr: Color(0xFFC72C41),
                              clr2: Color(0xFF801336),
                              icon: Icons.close,
                              msg: "Please enter your password",
                              title: "Oh snap!",
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: notify(
                            msg:
                                "Change a few things up and try submitting again",
                            title: "Invaid Email !",
                            clr: Color(0xFFC72C41),
                            clr2: Color(0xFF801336),
                            icon: Icons.close,
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: notify(
                          clr: Color(0xFFC72C41),
                          clr2: Color(0xFF801336),
                          icon: Icons.close,
                          msg: "Please enter your email",
                          title: "Oh snap!",
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ));
                    }
                  },
                ) /*Container(
                                              decoration: BoxDecoration(
                                                color: Colors.deepPurple,
                                                borderRadius: BorderRadius.circular(30),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromARGB(255, 190, 163, 227),
                                                    spreadRadius: 10,
                                                    blurRadius: 20,
                                                  ),
                                                ],
                                              ),
                                              child: ElevatedButton(
                                              child: Container(
                                                  width: double.infinity,
                                                  height: 50,
                                                  child: Center(child: Text("Sign In"))),
                                              onPressed: () => print("it's pressed"),
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.deepPurple,
                                                onPrimary: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                              ),
                                            ),
                                              ),*/
                ),
            SizedBox(height: 40),
            DelayedDisplay(
              delay: Duration(milliseconds: 400),
              child: Row(children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey[300],
                    height: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Or continue with"),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey[400],
                    height: 50,
                  ),
                ),
              ]),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DelayedDisplay(
                    delay: Duration(milliseconds: 400),
                    child: _loginWithButton(
                        context: context, image: 'images/google.png')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column welcome(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DelayedDisplay(
          delay: Duration(milliseconds: 200),
          child: Text("Hello!",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 1200
                      ? 70
                      : MediaQuery.of(context).size.width > 850 &&
                              MediaQuery.of(context).size.width < 1200
                          ? 50
                          : MediaQuery.of(context).size.width > 850
                              ? 50
                              : 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat-Regular",
                  color: Color(0xFF8591B0))),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width > 1000 ? 30 : 15,
        ),
        DelayedDisplay(
          delay: Duration(milliseconds: 200),
          child: RichText(
            text: TextSpan(
                text: "Welcome To ",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width > 1200
                        ? 70
                        : MediaQuery.of(context).size.width > 850 &&
                                MediaQuery.of(context).size.width < 1200
                            ? 50
                            : MediaQuery.of(context).size.width > 850
                                ? 50
                                : 30,
                    color: Color(0xFF8591B0)),
                children: [
                  TextSpan(
                      text: "NoMe",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 1200
                              ? 70
                              : MediaQuery.of(context).size.width > 850 &&
                                      MediaQuery.of(context).size.width < 1200
                                  ? 50
                                  : MediaQuery.of(context).size.width > 850
                                      ? 50
                                      : 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87))
                ]),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width > 1000 ? 30 : 15,
        ),
        DelayedDisplay(
          delay: Duration(milliseconds: 200),
          child: Visibility(
            visible: MediaQuery.of(context).size.width < 850 ? true : false,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              child:
                  Image.network("assets/images/illustration-2.png", scale: .10),
            ),
          ),
        ),
        DelayedDisplay(
          delay: Duration(milliseconds: 300),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 20),
            child: Text("LET’S EXPLORE THE WORLD"),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        DelayedDisplay(
          delay: Duration(milliseconds: 300),
          child: Padding(
            padding: EdgeInsets.only(
              left: 4.0,
              right: MediaQuery.of(context).size.width < 850 ? 40 : 74,
              top: 10,
              bottom: 40,
            ),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 8),
                        blurRadius: 8)
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        flex: 8,
                        child: TextField(
                          controller: email_controller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Your Email Address'),
                        )),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFC86DD7),
                                    Color(0xFF3023AE),
                                  ],
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft),
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                if (email_controller.text.isNotEmpty == true) {
                                  if (validator.email(email_controller.text) ==
                                      true) {
                                    setState(() {
                                      login = true;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: notify(
                                        msg:
                                            "Change a few things up and try submitting again",
                                        title: "Invaid Email !",
                                        clr: Color(0xFFC72C41),
                                        clr2: Color(0xFF801336),
                                        icon: Icons.close,
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                    ));
                                  }
                                }
                              },
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Visibility(
                                      visible:
                                          MediaQuery.of(context).size.width <
                                                  480
                                              ? false
                                              : true,
                                      child: Text("Next",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Montserrat-Bold",
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      850
                                                  ? 12
                                                  : MediaQuery.of(context)
                                                                  .size
                                                                  .width >
                                                              850 &&
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width <
                                                              1200
                                                      ? 12
                                                      : 16,
                                              letterSpacing: 1.0)),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width <
                                              850
                                          ? 4
                                          : MediaQuery.of(context).size.width >
                                                      850 &&
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      1200
                                              ? 6
                                              : 8,
                                    ),
                                    Image.network(
                                      "assets/images/sent.png",
                                      color: Colors.white,
                                      width: MediaQuery.of(context).size.width <
                                              850
                                          ? 12
                                          : MediaQuery.of(context).size.width >
                                                      850 &&
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      1200
                                              ? 12
                                              : MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      480
                                                  ? 50
                                                  : 20,
                                      height: MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              850
                                          ? 12
                                          : MediaQuery.of(context).size.width >
                                                      850 &&
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      1200
                                              ? 12
                                              : MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      480
                                                  ? 50
                                                  : 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class notify extends StatelessWidget {
  String title;
  String msg;
  IconData icon;
  Color clr;
  Color clr2;

  notify({
    super.key,
    required this.title,
    required this.msg,
    required this.icon,
    required this.clr,
    required this.clr2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            width: MediaQuery.of(context).size.width > 850
                ? MediaQuery.of(context).size.width / 3
                : MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            height: 90,
            decoration: BoxDecoration(
                color: clr, //Color(0xFFC72C41),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                SizedBox(
                  width: 48,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                        msg,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: SvgPicture.asset(
              "assets/icons/bubbles.svg",
              height: 48,
              width: 48,
              color: clr2, //Color(0xFF801336),
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/fail.svg",
                height: 40,
              ),
              Positioned(
                  top: 7, child: Icon(icon, size: 20, color: Colors.white)),
            ],
          ),
        )
      ],
    );
  }
}

Widget _loginWithButton(
    {required String image,
    bool isActive = false,
    required BuildContext context}) {
  return InkWell(
    onTap: () async {
      try {
        final GoogleSignInAccount? googleSignInAccount =
            await googleSignIn.signIn();
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await auth.signInWithCredential(credential);
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: notify(
            clr: Color(0xFFC72C41),
            clr2: Color(0xFF801336),
            icon: Icons.close,
            msg: e.message.toString(),
            title: "Somthing went wrong!",
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ));
        throw e;
      }
    },
    child: Container(
      width: MediaQuery.of(context).size.width < 850
          ? MediaQuery.of(context).size.width / 1.2
          : MediaQuery.of(context).size.width / 4,
      height: 50,
      decoration: isActive
          ? BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 10,
                  blurRadius: 30,
                )
              ],
              borderRadius: BorderRadius.circular(15),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey),
            ),
      child: Center(
          child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 15,
                  )
                ],
              )
            : BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              '$image',
              width: 25,
            ),
            Text("Sign In with Google")
          ],
        ),
      )),
    ),
  );
}
