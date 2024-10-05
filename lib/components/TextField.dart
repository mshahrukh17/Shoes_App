// ignore_for_file: deprecated_member_use, must_be_immutable
import '../export/AllExport.dart';

class TextFieldWidget extends StatelessWidget {
  String labeltext;
  TextEditingController controller;
  var prefixicon;
  var suffixicon;
  var keyboardtype;
  var obscurepass;
  final String? Function(String?)? validator;
  TextFieldWidget({
    super.key,
    required this.controller,
    required this.labeltext,
    this.suffixicon,
    this.prefixicon,
    this.obscurepass = false,
    this.keyboardtype, 
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: controller,
        validator: validator,
        cursorColor: Colors.white,
        autocorrect: true,
        cursorErrorColor: Colors.red,
        obscuringCharacter: "*",
        showCursor: true,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        enableSuggestions: true,
        keyboardType: keyboardtype,
        obscureText: obscurepass,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade800,
            labelText: labeltext,
            prefixIcon: prefixicon,
            suffixIcon: suffixicon,
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400
            ),
            suffixIconColor: Colors.white,
            prefixIconColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(12)
                  ),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1, 
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2
                  )
                ),
                focusedErrorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2
                  )
                ),
                disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(12)
                  ),
                  errorMaxLines: 1
                ),

      ),
    );
  }
}
