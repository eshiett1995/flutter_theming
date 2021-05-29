import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_theming/custom_theme.dart';

import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter theme animation',
      darkTheme: CustomTheme.darkTheme,
      theme: CustomTheme.lightTheme,
      themeMode: currentTheme.currentTheme,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated theme change"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SlideTransition(
              child: SvgPicture.asset('assets/images/sun.svg', width: 100, height: 100,),
            ),
            Offstage(
              offstage:  currentTheme.isDarkTheme,
              child: SvgPicture.asset('assets/images/sun.svg', width: 100, height: 100,)),
            Offstage(
                offstage: !currentTheme.isDarkTheme,
                child: SvgPicture.asset('assets/images/moon.svg', width: 100, height: 100,)),
            SizedBox(height: 100,),
            Text(
              '${currentTheme.isDarkTheme ? 'Dark' : 'Light'} theme activated',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          currentTheme.toggleTheme();
        },
        child: Icon(Icons.wb_sunny_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
