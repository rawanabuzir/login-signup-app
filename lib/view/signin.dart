import 'package:flutter/material.dart';
import 'package:login_app/model/linkapi.dart';
import 'package:login_app/view/crud.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
class Signup extends StatefulWidget {
  // final TextEditingController myController;

  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formstate = GlobalKey();
  Crud _crud = Crud();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isloading = false;

  signup() async {
    if(formstate.currentState!.validate()){
      // final snackBar =SnackBar (content:Text('submitting form'),);
      // formstate.currentState!.showSnackBar(snackBar);
     isloading = true;
     setState(() {});
     var response = await _crud.posrRequest(linkSignUp, {
       "username": username.text,
       "email": email.text,
       "password": password.text,
     });

     isloading = false;
     setState(() {});
     if (response['status'] == 'success') {

       Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);
     }
     else {
AwesomeDialog(context: context,title: 'hello',body: Text('something wrong '))..show();
     }
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: isloading == true
      // ? Center(child: CircularProgressIndicator())
      //     :
     body :ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
              //  color: Colors.red,
              width: double.infinity,
              height: 350,
              child:  Image(image: AssetImage('img/img3.jpg')),),
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,// يقوم بعمليه التحقق مباشره اثناء الكتابة
key: formstate,
            child: Column(

              children: [
                SizedBox(
                  width: 350,
                  child: TextFormField(
                      validator: (val){

                        if(val == null || val.isEmpty) {return " please enter valid data ";}

                        // if(!RegExp( '!@#<>?":_``~;[]\|=-+)(*&^%1234567890'
                        //   // ,caseSensitive: false,
                        //   // multiLine: false,
                        // ).hasMatch(val!)){
                        //   return "Enter Correct username";
                        //
                        //
                        // } else{return null;}
                        if(val.length<4){return"Enter Correct username and larger than 4"; }
                      },
                      controller: username,
                      cursorColor: Colors.cyan[800],
                      decoration: InputDecoration(
                        fillColor: Colors.cyan[800],
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Your name',
                        focusColor: Colors.cyan[800],
                        hoverColor: Colors.cyan[800],
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 350,
                  child: TextFormField(

                      validator: (val){

                        if(val == null || val.isEmpty) {return " please enter valid data ";}

                        if(!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(val!)){
                          return "Enter Correct Email";


                        } else{return null;}
                      },
                      controller: email,
                      cursorColor: Colors.cyan[800],
                      decoration: InputDecoration(
                        fillColor: Colors.cyan[800],
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: 'Enter Your Email',
                        focusColor: Colors.cyan[800],
                        hoverColor: Colors.cyan[800],
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 350,
                  child: TextFormField(

                            validator: (PassCurrentValue){

                              RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                              var passNonNullValue=PassCurrentValue??"";
                              if(passNonNullValue.isEmpty){
                                return ("Password is required");
                              }
                              if(!regex.hasMatch(passNonNullValue)){
                                return ("Password should contain upper,lower,digit and Special character ");
                              }
                             else  if(passNonNullValue.length<6){
                                return ("Password Must be more than 5 characters");
                              }
                            return null;
                            },
                      controller: password,
                      cursorColor: Colors.cyan[800],
                      decoration: InputDecoration(
                        fillColor: Colors.cyan[800],
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: 'Enter Your Password',
                        focusColor: Colors.cyan[800],
                        hoverColor: Colors.cyan[800],
                      )),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("login");
            },
            child: Container(
              width: 20,
              padding: const EdgeInsets.only(
                left: 25,
                top: 10,
              ),
              height: 50,
              child: Text(
                '  Back ? ',
                style: TextStyle(color: Colors.cyan[700]),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 30, right: 30, left: 30),
            width: 10,
            height: 80,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.cyan[800],
                ),
              ),
              onPressed: () async {
                await signup();
              },
              child: const Text(
                'signin',
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
