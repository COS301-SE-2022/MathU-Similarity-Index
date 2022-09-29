class StringChecker {
  static String correctLatex(String input) {
    String temp = '';

    if (input != null && input.isNotEmpty && input.length > 0) {
      for (int i = 0; i < input.length; i++) {
        if (input[i] == '\\') {
          temp += '\\';
        }

        temp += input[i];
      }
    }

    return temp;
  }
}
