// ignore_for_file: must_be_immutable
import '../export/AllExport.dart';

class AppButton extends StatelessWidget {
  final void Function() onpress;
  String buttontext;
  AppButton({super.key, required this.onpress, required this.buttontext});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 6,
      child: MaterialButton(
          minWidth: size.width * 0.9,
          animationDuration: Duration(milliseconds: 800),
          onPressed: onpress,
          color: Colors.white38,
          child: Text(buttontext, style: ThemeText.buttontitle(),),
          hoverColor: Colors.grey,
          elevation: 5,
          splashColor: Colors.grey.shade800,
          focusElevation: 5,
          height: size.height * 0.08,
          disabledColor: Colors.red.shade900,
          disabledTextColor: Colors.red,
          focusColor: Colors.grey.shade800,
          highlightColor: Colors.red.shade700,
          mouseCursor: SystemMouseCursors.basic,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12))),
    );
  }
}
