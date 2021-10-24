import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_6_3_1/models/user_model.dart';
import 'package:task_6_3_1/pages/sign_in.dart';
import 'package:task_6_3_1/services/pref_service.dart';

class SignUp extends StatefulWidget {
  static const String id = "sign_up";

  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cPasswordController = TextEditingController();

  void _doSignUp() async{
    String name = _nameController.text.toString();
    String email = _emailController.text.toString();
    String phone = _phoneController.text.toString();
    String password = _passwordController.text.toString();
    String cPassword = _cPasswordController.text.toString();
    User user = User(name: name,email: email,phone: phone,password: password,cPassword: cPassword);
    setState(() {
      Prefs.storeUser(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: (){
            Navigator.pushReplacementNamed(context, SignIn.id);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:   [
              const SizedBox(height: 30,),
              const Text("Let's Get Started!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
              const SizedBox(height: 5,),
              const Text("Create an account to Q Allure to get all features",style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 30,),
              //#name
              Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.white,
                  border: Border.all(color: Colors.blue,width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child:   Center(
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: "Yorqin Abrayev",
                      hintStyle: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15.0),
                      prefixIcon: Icon(Icons.person,color: Colors.blue,),
                      border: InputBorder.none,

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              //#email
              Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.white,
                  //border: Border.all(color: Colors.blue,width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child:   Center(
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                      prefixIcon: Icon(Icons.email,color: Colors.grey,),
                      border: InputBorder.none,

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              //#phone
              Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.white,
                  //border: Border.all(color: Colors.blue,width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child:   Center(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                      prefixIcon: Icon(Icons.phone_android_outlined,color: Colors.grey,),
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
                  color: Colors.white,
                  //border: Border.all(color: Colors.blue,width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child:   Center(
                  child: TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                      prefixIcon: Icon(Icons.lock_open_rounded,color: Colors.grey,),
                      border: InputBorder.none,

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              //#confirm password
              Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.white,
                  //border: Border.all(color: Colors.blue,width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child:   Center(
                  child: TextField(
                    controller: _cPasswordController,
                    decoration: const InputDecoration(
                      hintText: "Confirm password",
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                      prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                      border: InputBorder.none,

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              //#create
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 60),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueAccent
                ),
                child: TextButton(
                  onPressed: (){
                    _doSignUp();
                  },
                  child: const Text("CREATE",style: TextStyle(color: Colors.white,),),
                ),
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(width: 5,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, SignIn.id);
                    },
                    child: const Text("Login here",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
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
