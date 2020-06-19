import 'package:ccms/backend/models/user.dart';
import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store{

  User user = User();

  @observable
  String email = "";

  @action
  setEmail(String newEmail){
    email = newEmail;
    user.email = email;
  }

  @observable
  String password = "";

  @action
  setPassword(String newPassword){
    password = newPassword;
    user.password = password;
  }
}