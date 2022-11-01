import 'package:flutter/material.dart';
import 'package:signin/splashscreen.dart';
import 'package:signin/theme.dart';
import 'package:signin/widgets/input_fields.dart';
import 'package:signin/widgets/primary_button.dart';
import 'dart:async';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
final TextEditingController emailController = TextEditingController(text: '');
final TextEditingController passwordController = TextEditingController(text: '');

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: null,
        body: Container(
          padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("LogIn to your account", style: heading2.copyWith(color: textBlack),),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset('assets/images/accent.png',width: 100, height: 4,)
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Form(child: Column(
                children: [
                  InputField(
                      hintText: 'Email',
                      suffixIcon: SizedBox(),
                      controller: emailController,
                      ),
                  SizedBox(
                    height: 32,
                  ),
                  InputField(hintText: 'Password', suffixIcon: SizedBox(), controller: passwordController)
                ],
              )),
              SizedBox(
                height: 64,
              ),
              CustomPrimaryButton(buttonColor: primaryBlue, textValue: "Login Your Account", textColor: textWhiteGrey, onPressed: () {
                 // nanti kita arahkan kehalaman login
  //default user
                String user = 'km.kemal03@gmail.com';
                String pass = '1234';
                if  (emailController.text.length == 0) {
                  final errorUser = SnackBar(content: Text('Username tidak boleh kosong!'),duration: Duration(seconds: 2),);
                  _scaffoldKey.currentState!.showSnackBar(errorUser);
                } else if (passwordController.text.length == 0) {
                  final errorUser = SnackBar(content: Text('Password tidak boleh kosong!'),duration: Duration(seconds: 2),);
                  _scaffoldKey.currentState!.showSnackBar(errorUser);
                } else if (emailController.text == user && passwordController.text == pass) {
                  final errorUser = SnackBar(content: Text('Selamat datang user: ' + emailController.text),duration: Duration(seconds: 2),);
                  _scaffoldKey.currentState!.showSnackBar(errorUser);
                  //delay to Home page
                  Timer(Duration(seconds: 2), (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                  });
                } else {
                  final errorUser = SnackBar(content: Text('Cek kembali input anda!'),duration: Duration(seconds: 2),);
                  _scaffoldKey.currentState!.showSnackBar(errorUser);
                }
              },)
            ],
          ),
        ),
      ),
    );
  }
}
