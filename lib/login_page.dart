import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final  FirebaseAuth _auth = FirebaseAuth.instance;
  final  _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/place.jpeg'),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              width: size.width,
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blueGrey.withOpacity(0.30), Colors.black45]
                )
              ),
              child: Center(
                child: Text("TravelApp", style: TextStyle(fontFamily: 'Signatra', fontSize: 80, color: Colors.white),),
              ),
            ),
            Positioned(
              top: 220,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(62),
                    topRight: Radius.circular(62),
                  )
                ),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: "Usuario",
                            labelStyle: TextStyle(color: Colors.purple),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                              gapPadding: 10
                            ),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple), borderRadius: BorderRadius.all(Radius.elliptical(20,20)))
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              labelText: "Contraseña",
                              labelStyle: TextStyle(color: Colors.purple),
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                                  gapPadding: 10
                              ),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple), borderRadius: BorderRadius.all(Radius.elliptical(20,20)))
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            )
          ],
        )
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
