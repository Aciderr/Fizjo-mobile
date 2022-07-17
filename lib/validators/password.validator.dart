String? passwordValidator(dynamic value) {
  bool isPasswordValid = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$").hasMatch(value);
  if (isPasswordValid) {
    return null;
  }
  return "Hasło musi mieć 8 znaków w tym jedną cyfrę, jeden znak specjalny i dużą literę.";
}