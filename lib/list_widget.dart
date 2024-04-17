import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final names = ["Alejandro Soto", "Jose Pérez", "Fulano García", "María López", "Jorge Rivera"];

  final jobs = ["Ingeniero", "Arquitecto", "Abogado", "Presidenta", "Futbolista"];

  final selected = [false, false, true, false, false];

  final profilePics = ["https://randomuser.me/api/portraits/men/79.jpg","https://randomuser.me/api/portraits/women/37.jpg","https://randomuser.me/api/portraits/women/25.jpg","https://randomuser.me/api/portraits/men/60.jpg","https://randomuser.me/api/portraits/men/78.jpg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas en Flutter'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(profilePics[index]),),
              title: Text(names[index]),
              subtitle: Text(jobs[index]),
              trailing: Icon( Icons.star, color: selected[index] ? Colors.amber : Colors.grey,),
              onTap: (){
                selected[index] = !selected[index];
                setState(() {

                });
                print(selected[index]);
              },
            )
          );
        },
        padding: EdgeInsets.all(8),
      ),
    );
  }
}
