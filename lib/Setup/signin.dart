import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginapp/Pages/home.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  String _email,_password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in"),
      ),
      body: Form(
        key: _formkey,

        child: Column(
          children: <Widget>[

            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return 'Please type some email.';
                }
              },
              onSaved: (input){
                _email = input;
              },
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),

            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return 'Please provide password.';
                }
                if(input.length<6){
                  return 'Your password needs to be atleast 6 characters';
                }
              },
              onSaved: (input){
                _password = input;
              },
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),

            RaisedButton(
              onPressed: (){ 
                signIn();
               },
              child: Text('Sign in'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async{

    final formState = _formkey.currentState;
    if(formState.validate()){
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email:_email, password:_password);        
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        print(e.message);
      }
    }
  }
  }