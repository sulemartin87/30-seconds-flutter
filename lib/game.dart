import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  Game({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var defaultTextStyle = const TextStyle(fontSize: 30);
  var _selection = [true, false];
  var _timer = 30;
  var items = ['saasd', 'asdas', 'asdasd', 'dsadasda', 'asdasfedfgjidskl'];
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
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: InkWell(
                  // this is the one you are looking for..........
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
                    child: new Text('$_timer',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize:
                                50.0)), // You can add a Icon instead of text also, like below.
                    //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                  ), //............
                ),
              ),
              _buildCard()
            ],
          ),
        ));
  }

  Widget _buildCard() {
    return Card(
      color: Colors.blue,
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                  // Let the ListView know how many items it needs to build.
                  itemCount: items.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            item != null ? item : '',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          tileColor: Colors.white,
                          leading: Icon(
                            Icons.restaurant_menu,
                            color: Colors.white,
                          ),
                          trailing: Checkbox(
                            value: true,
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
