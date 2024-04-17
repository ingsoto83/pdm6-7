import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    print(_auth.currentUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Iniciar Sesión"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text(_auth.currentUser==null ? 'No hay usuario logeado' : 'Usuario logeado: ${_auth.currentUser?.email}'),
              _auth.currentUser!=null ? ElevatedButton(
                child: Text("Cerrar Sesión"),
                onPressed: ()async{
                  await _auth.signOut();
                  setState(() {

                  });
                },
              ) : Container()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>login(),
        child: Icon(Icons.login, color: Colors.white,),
        backgroundColor: Colors.red,
      ),
    );
  }

  login() async{
    try{
      UserCredential response = await _auth.signInWithEmailAndPassword(email: 'soto@its.mx', password: '123456');
      print(response.user);
      setState(() {

      });
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
        content: Row(
          children: [
            Icon(Icons.dangerous, color: Colors.white),
            SizedBox(width: 16,),
            Expanded(
              child: Text(e.toString()),
            )
          ],
        ),
      ));
    }
  }
}
