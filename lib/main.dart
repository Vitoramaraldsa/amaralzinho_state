import 'package:amaralzinho_state_example/amaralzinho_state/state/amaralzinho_callback_notifier.dart';
import 'package:amaralzinho_state_example/amaralzinho_state/state/amaralzinho_value_notifier.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counterChange = 0;
  int _counterValue = 0;

  late AmaralzinhoCallbackNotifier notifier;
  late AmaralzinhoValueNotifier valueNotifier;

  @override
  void initState() {
    notifier = AmaralzinhoCallbackNotifier();
    valueNotifier = AmaralzinhoValueNotifier(_counterValue);
    notifier.addCallback(callBack);
    valueNotifier.addCallback(callBack);
    super.initState();
  }

  void _incrementCounterWithChangeNotifier() {
    _counterChange++;
    notifier.notifyCallbacks();
  }

  void _incrementCounterWithValueNotifier() {
    _counterValue++;
    valueNotifier.set(_counterValue);
  }

  void callBack() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Change Notifier:',
            ),
            Text(
              '$_counterChange',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 25,
            ),
            const Text(
              'Value Notifier:',
            ),
            Text(
              '${valueNotifier.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _incrementCounterWithValueNotifier();
                  },
                  child: Text(
                    "Value Notifier",
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    _incrementCounterWithChangeNotifier();
                  },
                  child: Text(
                    "Change Notifier",
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
