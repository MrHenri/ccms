enum UserType {
  leader,
  servant
}

String userTypeToString(Object object) => object.toString().split('.').last;