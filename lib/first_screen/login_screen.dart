import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate() {
    if (formkey.currentState!.validate()) {
      print("Ok");
    } else {
      print("Error");
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.all
                  (Radius.circular(50)),color: Colors.white),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,right: 250),
                        child: Text("Sign in ",style: TextStyle(fontWeight: FontWeight.bold
                            ,fontSize: 30,color: Colors.red),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 270),
                        child: Text("account",style: TextStyle(fontWeight: FontWeight.w900
                          ,fontSize: 30,color: Colors.red,),),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required"),
                              MinLengthValidator(6, errorText: "More than 6 chars")
                            ]),
                            initialValue: "aayusharma.121@gmail.com",
                            showCursor: false,
                            decoration: InputDecoration(labelText: "EMAIL",labelStyle:
                            TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                                suffixIcon:Icon(Icons.email,color: Colors.red,size:30,)),
                          )
                      ),
                      SizedBox(height: 5,),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            initialValue: "Ayush",
                            showCursor: false,
                            obscureText: true,
                            decoration: InputDecoration(labelText: "PASSWORD",labelStyle:
                            TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                                suffixIcon:Icon(Icons.lock,color: Colors.red,size:30,)),
                          )
                      ),
                      Text("Forget Password?",style: TextStyle(color: Colors.red
                      ),textAlign: TextAlign.end,),
                      Text("Login With"),
                      ElevatedButton(
                          onPressed: validate,
                          child:Text("LOGIN"))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
