// ignore_for_file: must_be_immutable
import '../export/AllExport.dart';

class DividerText extends StatelessWidget {
  String? text;
  DividerText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: 20.0,
            color: Colors.grey,
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0), child: Text(text!)),
        Expanded(
          child: Divider(
            endIndent: 20.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
