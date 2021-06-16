import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SamplePage("캐시버튼 Sample"),
    );
  }
}

class SamplePage extends StatefulWidget {
  final String title;

  SamplePage(this.title); // constructor

  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {

  // method channel (android & IOS 통신)
  static const platform = const MethodChannel('cashbutton.com/value');

  // Text
  String _cashButtonTitle = "캐시버튼 샘플앱_플루터";
  String _suggestionText = "캐시버튼 문의";
  String _suggestionContents = "캐시버튼과 관련된 문의를 받기 위한 메뉴 노출 가이드";

  Future<void> _initCashButton() async {
    bool state;
    try {
      state = await platform.invokeMethod('cashButton_init');
    } on PlatformException catch (e) {
      print('_setCashButtonState() --> error: ${e.message}');
    }
  }

  Future<void> _actionSuggestion() async {
    String value;
    try {
      value = await platform.invokeMethod('suggestion');
    } on PlatformException catch (e) {
      print('_actionSuggestion() --> error: ${e.message}');
    }
  }

  @override
  void initState() {
    super.initState();
    _initCashButton();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Color(0xff8c9eff),
      body: ListView(
        children: <Widget>[
          titleSection(),
          suggestionSection(),
        ],
      ),
    ));
  }

  titleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                    image: AssetImage('images/avatye_flutter_title_image.png')),
                Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                Text(
                  _cashButtonTitle,
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                Container(
                  height: 0.5,
                  width: 500.0,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  suggestionSection() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            onPressed: _actionSuggestion,
            child: Row(
              children: [
                Image.asset(
                  'images/avatye_flutter_ic_cashbutton_blue.png',
                  width: 40,
                  height: 40,
                ),
                Padding(padding: EdgeInsets.fromLTRB(4, 8, 0, 0)),
                Text(_suggestionText,
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xFFFFFFFF),
                    ))
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(26, 2, 0, 0),
              child: Text(
                _suggestionContents,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFB6BAF6),
                ),
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
