class User{

   String ?name;
   String ?email;
   String ?phone;
   String ?password;
   String ?cPassword;

  User({this.name,this.email,this.phone,this.password,this.cPassword});

  User.from({this.name,this.password});

  User.fromJson(Map<String, dynamic> data):
        name = data['name'],
        email = data['email'],
        phone = data['phone'],
        password = data['password'],
        cPassword = data['cPassword'];

  Map<String, dynamic> toJson(){
    return {
      'name' : name,
      'email': email,
      'phone': phone,
      'password': password,
      'cPassword': cPassword
    };

  }




}