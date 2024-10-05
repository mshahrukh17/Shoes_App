import '../export/AllExport.dart';

class ThemeText {
  static TextStyle authtitle() {
    return TextStyle(
      fontFamily: 'semibold',
      fontSize: 26,
      // color: Colors.white
    );
  }

  static TextStyle title() {
    return TextStyle(
      fontFamily: 'semibold',
      fontSize: 20,
      // color: Colors.black,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle subtitle() {
    return TextStyle(
      fontFamily: 'semibold',
      fontSize: 13,
      // color: Colors.black,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle buttontitle() {
    return TextStyle(
      fontFamily: 'semibold',
      fontSize: 18,
      // color: color,
      fontWeight: FontWeight.w200
    );
  }

 static TextStyle shoetitle(color) {
    return TextStyle(
      fontFamily: 'semibold',
      fontSize: 16,
      color: color,
      fontWeight: FontWeight.w200
    );
  }

   static TextStyle shoebrand(color, size) {
    return TextStyle(
      fontFamily: 'bolditalic',
      fontSize: size,
      color: color,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle Scaffoldmessage(color) {
    return TextStyle(
      fontFamily: 'semibold',
      fontSize: 12,
      color: color,
      fontWeight: FontWeight.w200
    );
  }
}
