import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final List<int> items = List<int>.generate(30, (index) => index);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black,),
        body: ReorderableListView(
            children: List.generate(items.length, (index) => ListTile(
              key: Key('$index'),
              tileColor: items[index].isOdd ? Colors.white12 : Colors.white30,
              title: Text('${items[index]}'),
              trailing: Icon(Icons.drag_handle_sharp),
            )),
            onReorder: (int oldIndex,int newIndex){
              setState(() {
                if(oldIndex < newIndex){
                  newIndex -=1;
                }
                final int item = items.removeAt(oldIndex);
                items.insert(newIndex, item);
              });
            }),
      ),
    );
  }
}

