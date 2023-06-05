import 'package:assignment/pages/login_page.dart';
import 'package:assignment/pages/registerPage.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override

  bool showsLoginPage = true;
  void toggleScreens(){
setState(() {
  showsLoginPage =!showsLoginPage;
});
  }


  Widget build(BuildContext context) {

    if(showsLoginPage){
return LoginPage(showRegisterPage:toggleScreens );
    }else {
      return RegisterPage(showLoginPage:toggleScreens );
    }
  }
}