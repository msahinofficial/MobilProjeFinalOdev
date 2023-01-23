import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dosya/screens/login_screen.dart';
class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

Widget appbar(){
  return Container();
}

class MainScreenState extends State<MainScreen> {
@override 
  Widget build(BuildContext context){
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton
          (
            padding: const EdgeInsets.only(left: 10),
            onPressed: () {},
            icon: IconButton
            (
              icon: const Icon(Icons.menu),
              onPressed: (){},
            )
          ),
          
          actions: <Widget>[
            IconButton(
              padding: const EdgeInsets.only(right: 20),
              icon: const Icon(Icons.account_circle),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute
                  (
                    builder: (context) => const LoginScreen()
                  )
                );
              } 
              )
          ],
          
        ),

        body: const Center(

        ),
      ),
    );
  }
}