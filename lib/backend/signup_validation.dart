import 'package:ccms/backend/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup {
  String name;
  String email;
  String password;
  String confirmPassword;
  String cellPhone;
  String celula;
  String discipulador;
  String date;
  int driver;

  Signup({this.name, this.email, this.password, this.confirmPassword,
    this.cellPhone, this.celula, this.discipulador, this.date, this.driver});

  Signup.Validation({this.password, this.confirmPassword, this.driver});

  bool isPasswordValid(String password, String confirmPassword) =>
      password == confirmPassword ? true : false;

  bool isDriverValid(typeDriver) => typeDriver != 0 ? true : false;

//  register(){
//    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
//
////    User user = User(name, email, password, cellPhone, celula, discipulador, date);
////    setState(() {
////      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Senhas iguais")));
////    });
//  }
}
