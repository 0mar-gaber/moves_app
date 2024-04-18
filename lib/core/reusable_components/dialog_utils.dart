import 'package:flutter/material.dart';
class DialogUti{

  // late String firstMessage ;
  // late String secondMessage ;


  static showLoadingDialog(BuildContext context ){
    showDialog(context: context, builder: (context) {
      return const Material(
        color: Colors.transparent,
        child: Center(child: CircularProgressIndicator.adaptive(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation(Color.fromRGBO(
            30, 31, 34, 1.0)),)),
      );
    },);
  }


  static showMessageDialog({required BuildContext context,required String message}){

    showDialog(context: context, builder: (context) {
      return Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
            margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.04),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Text(message),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                TextButton(onPressed: (){Navigator.pop(context);}, child: const Text("OK",style: TextStyle(color:Color.fromRGBO(53, 152, 219, 1.0) ),)),
              ],
            ),
          ),
        ),
      );
    },);
  }


  static closeDialog(BuildContext context){
    Navigator.pop(context);
  }
}