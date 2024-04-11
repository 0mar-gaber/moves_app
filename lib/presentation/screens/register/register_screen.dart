
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constant.dart';
import '../../../core/reusable_components/custom_form_field.dart';
import '../../../core/utils/colors.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  static const String route = "register";

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  bool isConfirmObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        title: Text("Create Account",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.all(14),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  height: 15.h,
                ),
                CustomFormField(
                    controller: fullNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return " This field can`t be empty";
                      }

                      return null;
                    },
                    label: "Full Name",
                    keyboard: TextInputType.emailAddress),
                CustomFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return " This field can`t be empty";
                      }
                      if (!RegExp(Constants.emailRegex).hasMatch(value)) {
                        return "Enter valid email";
                      }
                      return null;
                    },
                    label: "Email",
                    keyboard: TextInputType.emailAddress),
                CustomFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return " This field can`t be empty";
                    }
                    if (value.length < 8) {
                      return "password should be at least 8 char";
                    }
                    return null;
                  },
                  label: "Password",
                  keyboard: TextInputType.visiblePassword,
                  obscureText: isConfirmObscure,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isConfirmObscure = !isConfirmObscure;
                        });
                      },
                      icon: Icon(
                        isConfirmObscure ? Icons.visibility_off : Icons
                            .visibility,
                        size: 20.h,
                        color: AppColors.unselectedIconColor,
                      )),
                ),
                CustomFormField(
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return "Don`t Match";
                    }
                  },
                  label: "Confirm Password",
                  keyboard: TextInputType.visiblePassword,
                  obscureText: isConfirmObscure,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isConfirmObscure = !isConfirmObscure;
                        });
                      },
                      icon: Icon(
                        isConfirmObscure ? Icons.visibility_off : Icons
                            .visibility,
                        size: 20.h,
                        color: AppColors.unselectedIconColor,
                      )),
                ),

                SizedBox(height: 10.h),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.backGroundColor,),
                    onPressed: () {

                    },
                    child: Text(
                      "Register ",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      ),

    );
  }


}