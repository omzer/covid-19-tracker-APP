class Utils {
  static Utils _utils;

  static Utils getInstance() {
    return _utils ?? (_utils = Utils());
  }

  String getFormattedNumber(String number) {
    if (number == null || number.length <= 3) return number;
    String res = '';
    int c = 0;
    for (int i = number.length - 1; i >= 0; i--) {
      c++;
      var digit = number[i];
      res = digit + res;
      if (c % 3 == 0) {
        res = ',' + res;
      }
    }
    return res[0] == ',' ? res.substring(1) : res;
  }
}
