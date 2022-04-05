
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore =FirebaseFirestore.instance;

class DatabaseService{
static Future<void> addData(String title, String details)async{
firestore.collection('notes').add({
'title':title,
'detail':details
}).whenComplete(() => print('sucess')).catchError((e){
  print(e.toString());
}
);
}

static Future<void>deletedata(String id)async{
  await firestore.collection('notes').doc(id).delete();
}

  static Future<void> updateData(String id, String title, String detail) async {
    firestore.collection('notes').doc(id).update({
      'title':title,
      'detail':detail,
    }
      
    );
  }
}