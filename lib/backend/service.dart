import 'package:ccms/backend/user_group.dart';

class Service {
  int _motorcycles = 0;
  int _bicycles = 0;
  int _cars = 0;
  UserGroup _groupService; //each service needs a group

  Service(this._groupService);

}