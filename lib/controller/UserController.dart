// import 'dart:developer';

import '../export/AllExport.dart';

class UserController extends GetxController{
  RxBool isloading = false.obs;
  RxList users = [].obs;

  setloading(val){
    isloading.value = val;
  }

  Future<void> getAllUsers() async {
    setloading(true);
    CollectionReference userref = FirebaseFirestore.instance.collection("users");
    try {
    QuerySnapshot snapshot = await userref.get(); 
    users.clear();
    for (var doc in snapshot.docs) {
      users.add(doc.data() as Map<String, dynamic>);
      // log(users.toString());
    }
    } catch (e) {
      message("Error", "Error while fetching users"+e.toString());
    }
    setloading(false);
  }
}