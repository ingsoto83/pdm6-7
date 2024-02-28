import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
          child: Text("Presionaste el botón ${count} veces!", style: TextStyle(fontSize: 34),)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          count++;
          setState(() {

          });
          print(count);
        },
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
