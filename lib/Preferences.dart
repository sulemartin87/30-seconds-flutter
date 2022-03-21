import 'package:flutter/material.dart';

class Preferences extends StatefulWidget {
  Preferences({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _PreferencesState createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  var defaultTextStyle = const TextStyle(fontSize: 25);
  var _selection = [true, false];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Preferences'),
        ),
        body: Container(
          color: Colors.yellow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Number of teams', style: defaultTextStyle),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Text('Number of steps', style: defaultTextStyle),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Use dice handicap', style: defaultTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: ToggleButtons(
                  // fillColor: Colors.white,
                  // borderColor: Colors.black,
                  fillColor: Colors.grey,
                  borderWidth: 2,
                  selectedBorderColor: Colors.black,
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                  // textStyle: defaultTextStyle,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 5.0,
                        ),
                        Text("Yes"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 5.0,
                        ),
                        Text("No"),
                      ],
                    )
                  ],
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0;
                          buttonIndex < _selection.length;
                          buttonIndex++) {
                        if (buttonIndex == index) {
                          _selection[buttonIndex] = true;
                        } else {
                          _selection[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  isSelected: _selection,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  // this is the one you are looking for..........
                  onTap: () => Navigator.pushNamed(context, '/game'),
                  child: new Container(
                    //width: 50.0,
                    //height: 50.0,
                    padding: const EdgeInsets.all(
                        30.0), //I used some padding without fixed width and height
                    decoration: new BoxDecoration(
                      shape: BoxShape
                          .circle, // You can use like this way or like the below line
                      //borderRadius: new BorderRadius.circular(30.0),
                      color: Colors.blue,
                    ),
                    child: new Text('Start',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize:
                                30.0)), // You can add a Icon instead of text also, like below.
                    //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                  ), //............
                ),
              ),
            ],
          ),
        ));
  }
}
