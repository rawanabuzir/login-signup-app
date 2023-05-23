
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:login_app/model/linkapi.dart';
import 'package:login_app/view/crud.dart';


class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
   bool isloading = false;
  Crud crud =  Crud();
  GlobalKey<FormState> formstate = GlobalKey();

   login () async{
     if(formstate.currentState!.validate())
     {isloading = true;
     setState(() {});
     var response = await crud.posrRequest(linklogin, {
       "email": email.text,
       "password": password.text,
     });

     isloading = false;
     setState(() {});
     if (response['status'] == 'success') {
       Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
     } else {

           AwesomeDialog(context: context , title: 'hello',body: Text('wrong input pleas try again \n \n \n'))..show();
     }}
   }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      // Container(
      //   child:isloading==true ? Center(child: CircularProgressIndicator(),)
      //   :
      ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
                //  color: Colors.red,
                width: double.infinity,
                height: 350,
                child: Image(image: AssetImage('img/img3.jpg')),

            ),
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

                          if(!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(val!)){
                            return "Enter Correct Email";


                          } else{return null;}
                        },

                        controller: email,
                        cursorColor: Colors.cyan[800],
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.symmetric(
                          //   vertical: 10,
                          // ),
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
                        obscureText : true,

                        validator: (val){
                          if(val == null || val.isEmpty) {return " please enter valid data ";}
                          if(val.length>100){return "use number of character less than 100";} if(val.length<3){return "use number of character more than 3";}

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
                Navigator.of(context).pushNamed("sinup");
              },
              child: Container(
                width: 20,
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 10,
                ),
                height: 50,
                child: Text(
                  '    Creat account ?',
                  style: TextStyle(color: Colors.cyan[700]),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: 10,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.cyan[800]),
                ),
                  onPressed: ()  async {
                   await login();
                  },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
     //) // for the container >>>>>>.........................................
    );
  }
}
