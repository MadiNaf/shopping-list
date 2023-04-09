String? requiredField(String? value) {
  return value!.isEmpty ? 'Ce champs ne peut pas être vide.' : null;
}

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

String? priceValidator(String? value) {
  if (value != null) {
    double? strToDouble = double.tryParse(value);
    return strToDouble == null
        ? 'Veuillez saisir un prix valide! (ex: 9.99)'
        : null;
  } else {
    return requiredField(value);
  }
}
