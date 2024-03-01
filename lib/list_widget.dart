import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  ListWidget({super.key});

  final names = ["Alejandro Soto", "Jose Pérez", "Fulano García", "María López", "Jorge Rivera"];
  final jobs = ["Ingeniero", "Arquitecto", "Abogado", "Presidenta", "Futbolista"];
  final selected = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas en Flutter'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/79.jpg"),),
              title: Text("Alejandro Soto"),
              subtitle: Text("Ingeniero"),
              trailing: Icon(Icons.star, color: Colors.amber,),
              onTap: (){},
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/37.jpg"),),
              title: Text("Fulano Soto"),
              subtitle: Text("Arquitecto"),
              trailing: Icon(Icons.star, color: Colors.amber,),
              onTap: (){},
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/42.jpg",), ),
              title: Text("Mengano Soto"),
              subtitle: Text("Abogado"),
              trailing: Icon(Icons.star, color: Colors.amber,),
              onTap: (){},
            ),
          ),
        ],
      ),
    );
  }
}
