import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:task_6_3_1/models/user_model.dart';
import 'package:task_6_3_1/pages/finish_page.dart';
import 'package:task_6_3_1/pages/sign_up.dart';
import 'package:task_6_3_1/services/pref_service.dart';
class SignIn extends StatefulWidget {
  static const String id = "sign_in";

  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _email = TextEditingController();
  final _password = TextEditingController();

  void _doLogIn() async{
    String email = _email.text.toString();
    String password = _password.text.toString();

    User? user = await Prefs.loadUser();
    if(user!.email == email && user.password == password){
      setState(() {
        Navigator.pushReplacementNamed(context, FinishPage.id);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.grey.shade300.withOpacity(0.6),
                Colors.grey.shade300.withOpacity(0.4),
                Colors.grey.shade300.withOpacity(0.2),
              ]
            )
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const SizedBox(height: 100,),
              const Image(
                image: AssetImage("assets/images/pic1.jpg"),
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10,),
              const Text("Welcome back!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0,letterSpacing: 1.3),),
              const SizedBox(height: 10,),
              const Text("Log in to your existant accaunt of Q Allure",style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 60,),
              //#email
              Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.white,
                  border: Border.all(color: Colors.blue,width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child:  Center(
                  child: TextField(
                    controller: _email,
                    decoration: const InputDecoration(
                      hintText: "JoneWilliams@gmail.com",
                      hintStyle: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15.0),
                      prefixIcon: Icon(Icons.person,color: Colors.blue,),
                      border: InputBorder.none,

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              //#password
              Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.white
                  //border: Border.all(color: Colors.blue,width: 1)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child:  Center(
                  child: TextField(
                    controller: _password,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15.0),
                      prefixIcon: Icon(Icons.lock_open_rounded,color: Colors.grey,),
                      border: InputBorder.none,

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text("Forgot Password?",style: TextStyle(color: Colors.teal),)
                ],
              ),
              const SizedBox(height: 30,),
              //#login btn
              Container(
                height: 60,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue.shade900,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade900,
                      blurRadius: 10,
                      offset: const Offset(2,5),
                    )
                  ]
                ),
                child: TextButton(
                  onPressed: (){
                    _doLogIn();
                  },
                  child: const Text("LOG IN",style: TextStyle(color: Colors.white),),
                ),
              ),
              const SizedBox(height: 30,),
              const Text("Or connect using",style: TextStyle(color: Colors.grey),),
              //#fb google btns
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.shade900,
                        ),
                        child: TextButton(
                          onPressed: (){
                            
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  const [
                              Icon(FontAwesome.facebook_f,color: Colors.white,size: 18,),
                              SizedBox(width: 10,),
                              Text("Facebook",style: TextStyle(color: Colors.white,fontSize: 16),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: TextButton(
                          onPressed: (){

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  const [
                              Icon(FontAwesome.google,color: Colors.white,),
                              SizedBox(width: 10,),
                              Text("Google",style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //#signup
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, SignUp.id);
                    },
                    child: const Text("Sign Up",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 17.0),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
