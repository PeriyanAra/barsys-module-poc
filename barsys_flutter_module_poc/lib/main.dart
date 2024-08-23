import 'package:barsys_flutter_module_poc/random_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

Map<String, dynamic> stringToMap(String input) {
  // Split the input string by comma to get each key-value pair
  List<String> pairs = input.split(', ');

  // Create an empty map to store the result
  Map<String, dynamic> result = {};

  for (String pair in pairs) {
    // Split each pair by '=' to separate key and value
    List<String> keyValue = pair.split('=');

    // Check if the keyValue list has exactly 2 elements (key and value)
    if (keyValue.length == 2) {
      String key = keyValue[0];
      String value = keyValue[1];

      // Parse the value: convert it to int, bool, or keep as string
      dynamic parsedValue;
      if (value == 'true') {
        parsedValue = true;
      } else if (value == 'false') {
        parsedValue = false;
      } else if (int.tryParse(value) != null) {
        parsedValue = int.parse(value);
      } else {
        parsedValue = value;
      }

      // Add the key and parsed value to the result map
      result[key] = parsedValue;
    }
  }

  return result;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        final paths = settings.name?.split('/') ?? ['/'];
        final pathAndArgument = paths.isEmpty ? ['/'] : paths.last.split(':');
        final path = pathAndArgument.isNotEmpty ? pathAndArgument.first : null;
        final argumentsString =
            pathAndArgument.isNotEmpty ? pathAndArgument.last : null;

        final arguments = stringToMap(argumentsString.toString());

        if (path == 'random') {
          return MaterialPageRoute(
            builder: (context) => RandomScreen(
              data: int.tryParse(arguments['data'].toString()) ?? 0,
            ),
          );
        }

        return MaterialPageRoute(
          builder: (context) => const MyHomePage(
            title: 'Flutter Home Page',
          ),
        );
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
