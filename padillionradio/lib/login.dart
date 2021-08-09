import 'package:flutter/material.dart';
import 'package:padillionradio/playlist.dart';
import 'package:audioplayers/audioplayers.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PADILLION Radio',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        backgroundColor: Colors.grey[900],
      ),
      home: LoginPage(title: 'PADILLION Radio'),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(
      fontFamily: 'Apple SD Gothic Neo', fontSize: 20.0, color: Colors.white);

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final codeField = TextField(
      controller: myController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 30),
        textStyle: const TextStyle(
          fontSize: 20,
        ));

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey[900],
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 45.0),
                Text('Введите высланный вам код',
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                codeField,
                SizedBox(height: 25.0),
                SizedBox(
                  height: 35.0,
                ),
                ElevatedButton(
                    style: buttonStyle,
                    onPressed: onLogin,
                    child: Text('Войти',
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onLogin() {
    if (myController.text == '404') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PlaylistPage()),
      );
    }
  }
}
