import 'package:firebase_database/firebase_database.dart';
import 'package:shoe_app/export/AllExport.dart';

class AdminCategoryCOntroller extends GetxController{
  RxBool isloading = false.obs;
  RxList categories = [].obs;
  CollectionReference catref = FirebaseFirestore.instance.collection("Categories");

  setloading(val){
    isloading.value = val;
  }

  addCategory(String name) async {
    if (name.isEmpty) {
      message("Error", "Please Enter Category Name");
    } else {
      setloading(true);
      var key = FirebaseDatabase.instance.ref('CatKey').push().key;

      var catobj = {
        "catname": name,
        "catKey":key,
        "catstatus":"true"
      };
     await catref.doc(key).set(catobj);
     message("Added", "Category added successfully");
     setloading(false);
     getcategories();
    }
  }
   
   getcategories()async{
    categories.clear();
    setloading(true);
    await catref.get().then((QuerySnapshot snapshot){
      snapshot.docs.forEach((doc) {
        categories.add(doc.data());
      });
    });
    setloading(false);
   }
}