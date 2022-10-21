class Validator {
  static String? validateField({required String value}) {
    if (value.isEmpty) {
      return 'Field tidak boleh kosong';
    }

    return null;
  }

  static String? validatePassword({required String pw}) {
    if (pw.isEmpty) {
      return 'Field tidak boleh kosong';
    } else if (pw.length <= 8) {
      return 'Password tidak boleh kurang dari 8 karakter';
    }

    return null;
  }
}
