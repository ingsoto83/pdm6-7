import 'package:flutter/material.dart';

class ImagesWidget extends StatelessWidget {
  const ImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Uso de Imagenes",style: TextStyle(fontFamily: 'Signatra', fontSize: 40),),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            height:200,
            width: double.infinity,
            child: Image.asset('assets/img/gatos.jpeg', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 20),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/img/imagen1.jpg'),
                  fit: BoxFit.cover
                )
              ),
              child: Center(
                child: Text("Rarrrwww", style: TextStyle(color: Colors.white70, fontFamily: 'Signatra', fontSize: 80),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
