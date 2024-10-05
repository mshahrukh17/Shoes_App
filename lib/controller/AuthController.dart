import 'dart:developer';
import 'dart:io';
import '../export/AllExport.dart';

class AuthController extends GetxController {
  RxBool isloading = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController loginemailController = TextEditingController();
  TextEditingController loginpasswordController = TextEditingController();

  setloading(val) {
    isloading.value = val;
  }

  setprefences(data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", true);
    prefs.setString("name", data["email"]);
    prefs.setString("email", data["email"]);
    prefs.setString("usertype", data["usertype"]);
    prefs.setString("userID", data["userID"]);
  }

  Future<void> userRegister(String name, String email, String password) async {
    try {
      setloading(true);
      final UserCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      var uid = UserCredential.user!.uid;

      var userobj = {
        "name": name,
        "email": email,
        "password": password,
        "usertype": "user",
        "userID": uid,
      };
      CollectionReference users =
          await FirebaseFirestore.instance.collection("users");
      await users.doc(uid).set(userobj);
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      setloading(false);
      Get.offNamed(AppRoutes.Login);
      message("Created", "Account created Successfully");
    } on FirebaseAuthException catch (e) {
      setloading(false);
      if (e.code == 'email-already-in-use') {
        message(
          "Error",
          "This email is already in use. Please try another email.",
        );
      } else if (e.code == 'invalid-email') {
        message(
          "Error",
          "The email address is not valid.",
        );
      } else if (e.code == 'weak-password') {
        message(
          "Error",
          "The password is too weak.",
        );
      } else {
        message(
          "Error",
          "Something went wrong: ${e.message}",
        );
      }
    } on SocketException {
      setloading(false);
      message("Error",
          "No internet connection. Please check your network and try again.");
    } catch (e) {
      setloading(false);
      log(e.toString());
      message("Error", e.toString());
    }
  }

  Future<void> userlogin(
    String loginemail,
    String loginpassword,
  ) async {
    try {
      setloading(true);
      final UserCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: loginemail, password: loginpassword);
      var uid = UserCredential.user!.uid;

      FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          var data = documentSnapshot.data() as Map;
          log("User data : " + data["usertype"]);
          Get.offAllNamed(AppRoutes.Home);
          setprefences(data);
        } else {
          FirebaseFirestore.instance
              .collection("admin")
              .doc(uid)
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
              var data = documentSnapshot.data() as Map;
              print("Admin" + data["usertype"]);
              Get.offAllNamed(AppRoutes.AdminHome);
              setprefences(data);
            } else {
              message("Error", "Document does not exist!");
            }
          });
        }
        setloading(false);
         message("Success", "User Login Successfully");
        loginemailController.clear();
        loginpasswordController.clear();
      });
    }  
      on FirebaseAuthException catch (e) {
        setloading(false);
  if (e.code == 'user-not-found') {
    message("Error", "No user found for that email.");
  } else if (e.code == 'wrong-password') {
    message("Error", "Wrong password provided for that user.");
  } else if (e.code == 'too-many-requests') {
    message("Error", "Too many login attempts. Please try again later or reset your password.");
  } else {
    message("Error", e.message!);
  }
  } 
    catch (e) {
      setloading(false);
      message("Error",  "An unexpected error occurred: ${e.toString()}");
    }
  }
}
