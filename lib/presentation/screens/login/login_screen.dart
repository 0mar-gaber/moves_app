import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_app/core/utils/colors.dart';
import 'package:moves_app/presentation/screens/home/home_screen.dart';
import 'package:moves_app/presentation/screens/register/register_screen.dart';
import '../../../core/constant.dart';
import '../../../core/reusable_components/custom_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String route = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  bool isObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Login",
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                "Welcome back !",
                style: TextStyle(
                    color: AppColors.unselectedIconColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp),
              ),

              SizedBox(height: 20.h,),

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

              SizedBox(height: 20.h,),

              CustomFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == "" || value!.isEmpty) {
                    return " This field can`t be empty";
                  }
                  if (value.length < 8) {
                    return "password should be at least 8 char";
                  }
                  return null;
                },
                label: "Password",
                keyboard: TextInputType.visiblePassword,

                obscureText: isObscure,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                      size: 20.h,
                      color: AppColors.unselectedIconColor,
                    )),
              ),

              SizedBox(height: 20.h),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.infinity, 40.h),
                      backgroundColor: AppColors.primaryColor),
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      Navigator.pushNamed(context, HomeScreen.route);
                    }
                  },
                  child: Text(
                    "LOGIN ",
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  )),
               SizedBox(height: 15.h),
              Text("or",style: TextStyle(color: Colors.white,fontSize: 10.sp),textAlign: TextAlign.center,),
              SizedBox(height: 15.h),

              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context,RegisterScreen.route);
                  },
                  child: Text("Create My Account",style: TextStyle( color: AppColors.unselectedIconColor,fontSize: 10.sp),textAlign: TextAlign.center,)),
            ],
          ),
        ),
      ),

    );
  }
}
