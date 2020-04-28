class ValidationMixin {
  String validateEmail(String value) {
    if (value.contains("@") && value.contains(".")) {
      return null;
    }
    return "Invalid email address";
  }
  
  String validatePassword(String value) {
    if (value.length > 4) {
      return null;
    }
    return "password must be 5 characters long";
  }
}
