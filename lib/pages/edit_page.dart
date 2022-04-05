import 'package:flutter/material.dart';
import 'package:note_app/database_service.dart';

class EditData extends StatelessWidget {
  String?id;
  String?title;
  String?detail;
   EditData({ Key? key,this.id,this.title,this.detail }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController titlec=TextEditingController();
  TextEditingController detailc=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
            child: Column(
          children: [
            TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return 'please enter title';
                }
                return null;
              },
              controller: titlec,
              decoration:  InputDecoration(
                  hintText: 'please enter title',
                  labelText: "$title",
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              maxLength: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return 'Please enter a details';
                }
                return null;
              },
              maxLines: 10,
              decoration:  InputDecoration(
                  hintText: 'please enter details',
                  labelText: '$detail',
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              if (_formKey.currentState!.validate()) {
                DatabaseService.updateData(id!, titlec.text, detailc.text);
              }
            }, child:const  Text('Update'),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(double.infinity, 20))
            ),
            )
          ],
        )),
      ),
    );
  }
}