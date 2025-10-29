import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/widgets/custom_textformfield.dart';
import '../constants.dart';
import '../widgets/custom_inkwell_button.dart';
import '../widgets/custom_dialogs.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController usernameController =
      TextEditingController(text: 'user');
  TextEditingController passwordController =
      TextEditingController(text: 'user');
  final _formKey = GlobalKey<FormState>();

  bool isObscure = true;

  void login() {
    if (usernameController.text == 'user' &&
        passwordController.text == 'user') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (build) => HomeScreen(
                    username: usernameController.text,
                  )));
    } else {
      CustomDialogs.showErrorDialog(context, "Passwords do not match.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  color: FB_DARK_PRIMARY,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(25)),
                  child: Column(
                    children: [
                      Image.network(
                        'https://th.bing.com/th/id/OIP.d86EwCdh3EcXcPvPjWmJuwHaBU?rs=1&pid=ImgDetMain',
                        height: ScreenUtil().setHeight(200),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(30),
                      ),
                      CustomTextFormField(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        controller: usernameController,
                        validator: (value) =>
                            value!.isEmpty ? 'Enter your username' : null,
                        onSaved: (value) => usernameController.text = value!,
                        fontSize: ScreenUtil().setSp(15),
                        fontColor: FB_DARK_PRIMARY,
                        hintTextSize: ScreenUtil().setSp(15),
                        hintText: 'Username',
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      CustomTextFormField(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        controller: passwordController,
                        isObscure: isObscure,
                        validator: (value) =>
                            value!.isEmpty ? 'Enter your password' : null,
                        onSaved: (value) => passwordController.text = value!,
                        fontSize: ScreenUtil().setSp(15),
                        fontColor: FB_DARK_PRIMARY,
                        hintTextSize: ScreenUtil().setSp(15),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscure ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(50),
                      ),
                      CustomInkwellButton(
                        onTap: () {
                          if (usernameController.text == 'user' &&
                              passwordController.text == 'user') {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (build) => HomeScreen(
                                          username: usernameController.text,
                                        )));
                          } else {
                            CustomDialogs.showErrorDialog(context,
                                "Username and Password does not match.");
                          }
                        },
                        height: ScreenUtil().setHeight(40),
                        width: ScreenUtil().screenWidth,
                        buttonName: 'Login',
                        fontSize: ScreenUtil().setSp(15),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  color: FB_DARK_PRIMARY,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You do not have an account? ',
                        style: TextStyle(
                            color: Colors.grey.shade200,
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.popAndPushNamed(context, '/register'),
                        child: Text(
                          'Register here',
                          style: TextStyle(
                              color: FB_LIGHT_PRIMARY,
                              fontSize: ScreenUtil().setSp(15),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
