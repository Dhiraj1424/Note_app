import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app/database_service.dart';
import 'package:note_app/pages/add.dart';

import 'edit_page.dart';

class ShowData extends StatefulWidget {
  const ShowData({ Key? key }) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  navigation(BuildContext context, Widget next){
    Navigator.push(context,   MaterialPageRoute(builder: (_)=>next));
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       floatingActionButton: FloatingActionButton(onPressed: (
       
       ){
         navigation(context, AddPage());
       },
      child: Icon(Icons.add),),
      body:StreamBuilder(
        
        stream: FirebaseFirestore.instance.collection('notes').snapshots(),
        builder: ( context,AsyncSnapshot<QuerySnapshot> snapShoot){
          
          return ListView.builder(
            
            itemCount: snapShoot.data!.docs.length,
            itemBuilder: (context,indext){
              final res=snapShoot.data!.docs[indext];
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (v){
                DatabaseService.deletedata(res.id);
              },
              child: Card(
                
                child: ExpansionTile(title: Text('${res['title']} '),
                children: [
                  Text('${res['detail']}'),
                ],
                leading: IconButton(onPressed: (){
                  navigation(context, EditData(
                    id: res.id,
                    title:res['title'],
                    detail: res['detail'],
                  ));
                },icon: Icon(Icons.edit), ),
                )
              ),
            );
          });
        })
    );
  }
}