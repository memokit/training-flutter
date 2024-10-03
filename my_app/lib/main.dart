import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/training-2/grid_view_builder_page.dart';
import 'package:my_app/training-2/grid_view_count_page.dart';
import 'package:my_app/training-2/list_view_custom_page.dart';
import 'package:my_app/training-2/list_view_page.dart';
import 'package:my_app/training-3/icon_page.dart';
import 'package:my_app/training-3/image_page.dart';
import 'package:my_app/training-4/argument_first_page.dart';
import 'package:my_app/training-4/argument_second_page.dart';
import 'package:my_app/training-4/navigator_page.dart';
import 'package:my_app/training-4/route_name_2_page.dart';
import 'package:my_app/training-4/route_name_page.dart';
import 'package:my_app/training-5/get_builder_state_page.dart';
import 'package:my_app/training-5/getx_state_page.dart';
import 'package:my_app/training-5/obx_state_page.dart';
import 'package:my_app/training-5/state_main_page.dart';
import 'package:my_app/training-5/state_mixin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: ListViewPage(),
      // home: const GridViewCountPage(),
      // home: ListViewCustomPage(),
      // home: const GridViewBuilderPage(),
      // home: const ImagePage(),
      // home: const IconPage(),
      // home: const NavigatorPage(),

      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => StateMainPage()),
        GetPage(name: '/obxStatePage', page: () => ObxStatePage()),
        GetPage(
            name: '/getBuilderStatePage', page: () => GetBuilderStatePage()),
        GetPage(name: '/getxStatePage', page: () => GetxStatePage()),
        GetPage(name: '/stateMixinPage', page: () => StateMixinPage()),
      ],
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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
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
