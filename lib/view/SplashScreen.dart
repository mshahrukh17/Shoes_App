import '../export/AllExport.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () { 
      checkdata();
    });
  }

  checkdata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLoggedIn = prefs.getBool("login") ?? false;
    if (isLoggedIn) {
    var userType = prefs.getString("usertype");
  print("Login Status: $isLoggedIn, UserType: $userType");

    if (userType == "admin") {
      Get.offAllNamed(AppRoutes.AdminHome);
    } else if (userType == "user") {
      Get.offAllNamed(AppRoutes.Home);
    } else {
      Get.offAllNamed(AppRoutes.SignUp);
    }
  } else {
    // If no user is logged in, go to SignUp
    Get.offAllNamed(AppRoutes.SignUp);
  }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/logo2.webp", color: Colors.white, height: 1.sh * 0.4),
        ),
      ),
    );
  }
}