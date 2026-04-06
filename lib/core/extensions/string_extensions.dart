extension StringExtensions on String {
  String removeBibleVerseNumbers() {
    final buffer = StringBuffer();
    int i = 0;

    while (i < length) {
      if (_isDigit(this[i])) {
        final hasValidBefore = i == 0 || _isBoundary(this[i - 1]);

        if (hasValidBefore) {
          int j = i;

          while (j < length && _isDigit(this[j])) {
            j++;
          }

          int k = j;

          while (k < length && _isInlineWrapper(this[k])) {
            k++;
          }
          
          if (k < length && _isLetter(this[k])) {
            i = j;
            continue;
          }
        }
      }

      buffer.write(this[i]);
      i++;
    }

    return buffer.toString();
  }

  bool _isDigit(String c) {
    final code = c.codeUnitAt(0);
    return code >= 48 && code <= 57;
  }

  bool _isLetter(String c) {
    return RegExp(r'[A-Za-zÀ-ÖØ-öø-ÿ]').hasMatch(c);
  }

  bool _isBoundary(String c) {
    return c == ' ' ||
        c == '\n' ||
        c == '\t' ||
        c == '"' ||
        c == '\'' ||
        c == '“' ||
        c == '”' ||
        c == '‘' ||
        c == '’' ||
        c == '(' ||
        c == '[' ||
        c == '{' ||
        c == '—' ||
        c == '-' ||
        c == '–';
  }

  bool _isInlineWrapper(String c) {
    return c == '"' ||
        c == '\'' ||
        c == '“' ||
        c == '”' ||
        c == '‘' ||
        c == '’' ||
        c == '(' ||
        c == '[' ||
        c == '{';
  }
}