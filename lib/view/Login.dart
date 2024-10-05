import 'package:shoe_app/controller/AuthController.dart';

import '../export/AllExport.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var authcontroller = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();
  var loginshowpass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 15, top: 20, bottom: 20),
              child: Row(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                            colors: [Color(0xfffEFD4B4), Color(0xfffF17870)])
                        .createShader(bounds),
                    child: Text(
                      'Login Account',
                      style: ThemeText.authtitle(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFieldWidget(
              controller: authcontroller.loginemailController,
              labeltext: 'Email',
              prefixicon: Icon(Icons.mail_outline),
              validator: (value) {
                RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
                if (value == null || value.isEmpty) {
                  return "Please Enter Your Email";
                } else if (!regExp.hasMatch(value)) {
                  return "Enter your Valid Gmail";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            TextFieldWidget(
                obscurepass: !loginshowpass,
                controller: authcontroller.loginpasswordController,
                labeltext: 'Password',
                prefixicon: Icon(Icons.lock_outline),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter your Password";
                  } else if (value.length < 6) {
                    return "Password Must be 6 letters or above";
                  }
                  return null;
                },
                suffixicon: IconButton(
                    onPressed: () {
                      setState(() {
                        loginshowpass = !loginshowpass;
                      });
                    },
                    icon: Icon(loginshowpass
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined))),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => authcontroller.isloading.value
                  ? CircularProgressIndicator()
                  : AppButton(
                      onpress: () {
                        if (formKey.currentState!.validate()) {
                          authcontroller.userlogin(
                              authcontroller.loginemailController.text,
                              authcontroller.loginpasswordController.text);
                          return print("object");
                        }
                      },
                      buttontext: 'Login',
                    ),
            ),
            SizedBox(
              height: 40,
            ),
            DividerText(
              text: "OR",
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.SignUp, arguments: 'hello'),
                child: Text("Don't Have an Account? SignUp"))
          ],
        ),
      ),
    );
  }
}
