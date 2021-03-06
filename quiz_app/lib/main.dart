// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './question.dart';
import 'answer.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppState();
  }
}

class _AppState extends State<App> {
  var _index = 0;
  var _totalscore = 0;

  final questions = [
    {
      'question': 'what\'s your favorite color?',
      'answer': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 0},
        {'text': 'blue', 'score': 5}
      ],
    },
    {
      'question': 'what\'s your favorite food?',
      'answer': [
        {'text': 'Pasta', 'score': 10},
        {'text': 'Pizza', 'score': 5},
        {'text': 'mansaf', 'score': 0}
      ],
    },
    {
      'question': 'what\'s your favorite drink?',
      'answer': [
        {'text': 'water', 'score': 5},
        {'text': 'lemon', 'score': 10},
        {'text': 'orange', 'score': 0}
      ],
    },
  ];

  void _answer(int score) {
    setState(() {
      _index++;
      _totalscore += score;
    });
    if (_index <= questions.length) {
      print(score);
    } else {
      print('you did it !');
    }
  }

  void resetquiz() {
    setState(() {
      _index = 0;
      _totalscore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter app'),
        ),
        body: _index < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_index]['question'],
                  ),
                  ...(questions[_index]['answer'] as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(() => _answer(answer['score'] as int),
                        answer['text'] as String);
                  }).toList()
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('your total score ${_totalscore.toString()}/30'),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Center(
                        child: FloatingActionButton.extended(
                      backgroundColor: Colors.pink[400],
                      foregroundColor: Colors.black,
                      onPressed: () => resetquiz(),
                      icon: Icon(Icons.access_time_filled_rounded),
                      label: Text('retake quiz'),
                    )
                        //     FloatingActionButton(
                        //   child: Text('retake quiz'),
                        //   onPressed: () => resetquiz(),
                        //   backgroundColor: Colors.pink[400],
                        // )
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
