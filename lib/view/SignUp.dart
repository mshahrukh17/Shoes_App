import 'package:shoe_app/controller/AuthController.dart';
import '../export/AllExport.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var authController = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();
  var showpass = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.07,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                      child: Row(
                        children: [
                          ShaderMask(
                            shaderCallback: (_) => LinearGradient(colors: [
                              Colors.blueGrey.shade600,
                              Colors.blueGrey.shade400
                            ]).createShader(_),
                            child: Text(
                              'Register or Create\nAccount',
                              style: ThemeText.authtitle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFieldWidget(
                      controller: authController.nameController,
                      labeltext: 'Name',
                      prefixicon: Icon(Icons.person_outline_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter your Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFieldWidget(
                      controller: authController.emailController,
                      labeltext: 'Email',
                      prefixicon: Icon(Icons.mail_outline),
                      validator: (value) {
                        RegExp regExp =
                            RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
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
                        obscurepass: !showpass,
                        controller: authController.passwordController,
                        labeltext: 'Password',
                        prefixicon: Icon(Icons.lock_outline),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Set your Password";
                          } else if (value.length < 6) {
                            return "Password Must be 6 letters or above";
                          }
                          return null;
                        },
                        suffixicon: IconButton(
                            onPressed: () {
                              setState(() {
                                showpass = !showpass;
                              });
                            },
                            icon: Icon(showpass
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined))),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(() => authController.isloading.value
                        ? CircularProgressIndicator()
                        : AppButton(
                            onpress: () {
                              if (formKey.currentState!.validate()) {
                                authController.userRegister(
                                    authController.nameController.text,
                                    authController.emailController.text,
                                    authController.passwordController.text);
                                return print("object");
                              }
                            },
                            buttontext: 'SignUp',
                          )),
                    SizedBox(
                      height: 30,
                    ),
                    DividerText(
                      text: "OR",
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(12),
                          elevation: 5,
                          child: Container(
                            height: 40,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.facebook,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(12),
                          elevation: 5,
                          child: Container(
                            height: 40,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.apple,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.Login),
                        child: Text('Already Have an Account? Login'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
