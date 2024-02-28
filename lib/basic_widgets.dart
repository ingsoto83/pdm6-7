import 'package:flutter/material.dart';
class BasicWidgets extends StatelessWidget {
  const BasicWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Básicos"),
      ),
      body: Column(
        children: [
          Text("Bienvenidos a su", style: TextStyle(fontSize: 18),),
          Text("Primer Unidad", style: TextStyle(fontSize: 18)),
          Text("REPROBADA", style: TextStyle(fontSize: 18)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber,),
              Icon(Icons.star, color: Colors.amber,),
              Icon(Icons.star, color: Colors.amber,),
              Icon(Icons.star, color: Colors.amber,),
              Icon(Icons.star, color: Colors.amber,),
            ],
          ),
          Stack(
            children: [
              Container(
                height: 200,
                width: 200,
                color: Colors.red,
              ),
              Container(
                height: 150,
                width: 150,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){}, child: Text("Reset")),
              ElevatedButton(onPressed: (){}, child: Text("Send")),
              ElevatedButton(onPressed: (){}, child: Text("Save")),
            ],
          )
        ],
      ),
    );
  }
}
