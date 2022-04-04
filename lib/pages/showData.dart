import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app/pages/add.dart';

class ShowData extends StatefulWidget {
  const ShowData({ Key? key }) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  navigation(BuildContext context){
    Navigator.push(context,   MaterialPageRoute(builder: (_)=>AddPage()));
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       floatingActionButton: FloatingActionButton(onPressed: (
       
       ){
         navigation(context);
       },
      child: Icon(Icons.add),),
      body:StreamBuilder(
        
        stream: FirebaseFirestore.instance.collection('notes').snapshots(),
        builder: ( context,AsyncSnapshot<QuerySnapshot> snapShoot){
          
          return ListView.builder(
            
            itemCount: snapShoot.data!.docs.length,
            itemBuilder: (context,indext){
              final res=snapShoot.data!.docs[indext];
            return Card(
              
              child: ExpansionTile(title: Text('${res['title']} '),
              children: [
                Text('${res['detail']}'),
              ],
              leading: IconButton(onPressed: (){},icon: Icon(Icons.edit), ),
              )
            );
          });
        })
    );
  }
}