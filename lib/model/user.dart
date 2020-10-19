enum UserType {
  guest,
  user,
}

class User {
  static String id;
  static UserType type = UserType.guest;
  static String name;
  static String password;
  static String tarif;
  static String phone;
  static String email;
}
