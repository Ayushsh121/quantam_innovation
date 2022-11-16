import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate(){
    if(formkey.currentState!.validate()){
      print("Ok");
    }else{
      print("Error");
    }
  }
  bool shouldCheck = false;
  bool shouldCheckDefault = false;
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
                     padding: const EdgeInsets.only(top: 20,right: 270),
                     child: Text("Create an",style: TextStyle(fontWeight: FontWeight.bold
                  ,fontSize: 30,color: Colors.red),),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(right: 270),
                     child: Text("Account",style: TextStyle(fontWeight: FontWeight.w900
                  ,fontSize: 30,color: Colors.red,),),
                   ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(autofocus: false,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            MinLengthValidator(6, errorText: "More than 6 chars")
                          ]),
                          initialValue: "Ayush Sharma",
                          showCursor: false,
                          decoration: InputDecoration(labelText: "NAME",labelStyle:
                          TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                              suffixIcon:Icon(Icons.person,color: Colors.red,size:30,)),
                      )
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
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(right: 300),
                        child: Text("contact no.",style: TextStyle(fontSize: 20,
                            fontWeight:FontWeight.bold ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IntlPhoneField(
                          decoration: InputDecoration(
                            labelText: 'Phone Number',labelStyle: TextStyle(),
                            suffixIcon: Icon(Icons.call,color: Colors.red,),
                          ),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            initialValue: "Ayush Sharma",
                            showCursor: false,
                            obscureText: true,
                            decoration: InputDecoration(labelText: "PASSWORD",labelStyle:
                            TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                                suffixIcon:Icon(Icons.lock,color: Colors.red,size:30,)),
                          )
                      ),
                      Row(
                        children: [
                          CustomCheckBox(
                            value: shouldCheck,
                            shouldShowBorder: true,
                            borderColor: Colors.red,
                            checkedFillColor: Colors.red,
                            borderRadius: 8,
                            borderWidth: 3,
                            checkBoxSize: 22,
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                shouldCheck = val;
                              });
                            },
                          ),
                          SizedBox(width: 10,),
                          Text("I agree with",style: TextStyle(fontSize: 25,
                              fontWeight:FontWeight.bold ),),
                          Text("terms and condition",style: TextStyle(fontSize: 25,
                              fontWeight:FontWeight.bold ,color: Colors.red),),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: validate,
                          child:Text("REGISTER"))
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
