String? emailValidator(String? email) {
  return email!.isEmpty ? 'Entrez un email' : null;
}

String? passwordValidator(String? password) {
  return password!.length < 6
      ? 'Le mot de passe doit avoir au moins 6 caractères!'
      : null;
}

String? passwordConfirmationValidator(String pwd, String? pwdConfirm) {
  return pwd != pwdConfirm ? 'Le mot de passe ne corresponds pas!' : null;
}
