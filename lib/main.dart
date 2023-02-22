import 'package:flutter/material.dart';
import 'package:media_booster_intro/screens/intro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pres = await SharedPreferences.getInstance();
  bool istrue = pres.getBool('isskips') ?? false;
  pres.setBool('isskips', istrue);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (istrue == false) ? 'intro' : '/',
      routes: {'/': (context) => home(), 'intro': (context) => intro()},
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dasbord"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() async {
                  SharedPreferences pres =
                  await SharedPreferences.getInstance();
                  pres.remove('isskips');
                  Navigator.of(context).pushReplacementNamed('intro');
                });
              },
              icon: Icon(Icons.power_settings_new_outlined))
        ],
      ),
    );
  }
}