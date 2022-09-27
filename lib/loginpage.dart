import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/authservice.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget
{
  
  FirebaseFirestore firestore = FirebaseFirestore.instance; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.green,
       title: const Text("Home",
         style: TextStyle(
         fontSize: 21
       ),),
       actions: [
         TextButton.icon(onPressed:()async{
           await AuthService().signOut();
         } , icon: Icon(Icons.logout),label: const Text("Log Out"),
           style: TextButton.styleFrom(primary: Colors.white),)
       ],
     ),
     body: Container(
       width: MediaQuery.of(context).size.width,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           ElevatedButton(
             onPressed: ()async{
               CollectionReference users = firestore.collection('users');
               await users.add({
                 'name': 'Asutosh',
               });
             }, child: Icon(Icons.add),
           ),
         ],
       ),
     ),
    );
  }
}