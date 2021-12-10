import 'package:flutter/material.dart';
import 'lab1.dart';

void main() {
  runApp(const MyApp());

  Employee obj = Employee("Nikita", 19, "programmer");
  Function func = obj.call();
  func();
  print(obj.toString());
  obj.name = "Ivan";
  print(obj.name);
  obj.checkJob(obj.job);

  Employee? factory = Employee.factory();
  print(factory.toString());
  factory.name = "smth";
  factory = null;
  Employee? anotherFactory = Employee.factory();
  print(anotherFactory.toString());
  anotherFactory = null;
  anotherFactory ??= Employee.factory();
  print(anotherFactory.toString());

  print(execute((int a, int b)=> a * b, number: 10));

  List<Employee> list = [];
  list.add(obj);
  list.forEach((element) {print(element);});
  list.clear();

  Map <String, int> map = {
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 5
  };
  map.forEach((key, value) {
    if(key != value.toString()) {
      value = int.parse(key);
    }
    print("key: $key, value: $value");
  });
  map.clear();

  Set<int> numbers = {1, 2, 3, 4};
  numbers.add(4);
  print("set length: ${numbers.length}");
  numbers.clear();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(key: ObjectKey("1"), title: 'TI-81 Nikita Nesterov'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
