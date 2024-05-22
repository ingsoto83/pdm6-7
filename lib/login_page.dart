import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pdm6/list_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final  FirebaseAuth _auth = FirebaseAuth.instance;
  final  _formKey = GlobalKey<FormState>();
  bool visible = false;
  bool loading = false;
  String user = "";
  String pass = "";

  @override
  void initState() {
    super.initState();
    if(_auth.currentUser!=null){
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>ListWidget()));
      });
    }
  }

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
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                        child: TextFormField(
                          validator: (value)=> value!.isEmpty ? "Escribe tu usuario" : null,
                          onSaved: (value) => user = value??'',
                          decoration: const InputDecoration(
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
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "Escribe tu contraseña...!";
                            }else if(value.length < 6){
                              return "Debe ser de almenos 6 caracteres";
                            }else{
                              return null;
                            }
                          },
                          onSaved: (value)=> pass = value??'',
                          obscureText: visible ? false : true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  visible = !visible;
                                  setState(() {

                                  });
                                },
                                child: Icon(visible ? Icons.visibility_off : Icons.visibility)
                              ),
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
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                        height: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),padding: EdgeInsets.all(0.0)),
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              _formKey.currentState!.save();
                              login();
                            }
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors:[Colors.purple, Colors.blue]
                              ),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              constraints: BoxConstraints(minHeight: 80),
                              child: loading ? Center(child: CircularProgressIndicator(backgroundColor: Colors.white,color: Colors.lightGreenAccent,),) : Text("Iniciar Sesión",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            )
                          )
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
    setState(() {
      loading =true;
    });
    try{
      UserCredential response = await _auth.signInWithEmailAndPassword(email: user, password: pass);
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
    }finally{
      setState(() {
        loading=false;
        if(_auth.currentUser!=null){
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>ListWidget()));
        }
      });
    }
  }
}
