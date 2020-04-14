import 'package:ccms/backend/type_driver.dart';

class Validation {
  //TODO Validação dos outros campos

  bool isPasswordValid(String password, String confirmPassword) =>
      password == confirmPassword ? true : false;

  TypeDriver whatTypeDriver(int typeDriver){
    switch(typeDriver) {
      case 0: {return null;}
      break;
      case 1: {return TypeDriver.A;}
      break;
      case 2: {return TypeDriver.B;}
      break;
      case 3: {return TypeDriver.AB;}
      break;
      default: {return TypeDriver.Nao_Habilitado;}
      break;
    }
  }

  bool generalValidation(String password, String confirmPassword, TypeDriver typeDriver){
    bool validationPassword = this.isPasswordValid(password, confirmPassword);
    bool validationTypeDriver = this.whatTypeDriver(typeDriver.index) != null ? true : false;

    return validationPassword && validationTypeDriver ? true : false;
  }

}