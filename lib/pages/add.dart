import 'package:flutter/material.dart';
import 'package:note_app/database_service.dart';

class AddPage extends StatelessWidget {
   AddPage({ Key? key }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController titlec=TextEditingController();
  TextEditingController detailc=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: const Center(child: Text("Note")),
      ),
      body: SingleChildScrollView(
        child: Form(
          key:_formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: Column(
              
              children: [
                TextFormField(
      
                  validator: (v){
                    if(v!.isEmpty){
                      return 'please enter a title';
                    }
                    return null;
                  },
                  controller: titlec,
                  maxLines: 1,
                  decoration:const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                      
                    ),
                    hintText: 'enter title',
                    labelText: 'Title',
                    labelStyle: TextStyle(color: Colors.red),
                    
                  
                  ),
                  
                ),
                const SizedBox(height: 20,),
                TextFormField(
                   validator: (v){
                    if(v!.isEmpty){
                      return 'please enter a detail';
                    }
                    return null;
                  },
                   controller: detailc,
                   minLines: 1,
                   maxLines: 7,
                    decoration:const InputDecoration(
                      
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                      
                    ),
                    
                    hintText: 'enter deatils',
                    labelText: 'details',
                    labelStyle: TextStyle(color: Colors.red),
                    
                  
                  ),
                ),
                const SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                if (_formKey.currentState!.validate()){
                  // DatabaseService is a class and addDatais Method 
                  DatabaseService.addData(titlec.text, detailc.text);
                }
              }, child: const Text('Add'),
              
              style: ButtonStyle(
                
                backgroundColor: MaterialStateProperty.all(Colors.grey),
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 40)),
                
              ),
              
              )
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}