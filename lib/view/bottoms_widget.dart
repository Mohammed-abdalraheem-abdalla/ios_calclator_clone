import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final Function callback;

  const CalcButton({Key? key, required this.text, required this.textColor, required this.buttonColor, required this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: SizedBox(
        height: 65,
        width: 65,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)
            ),
            primary: buttonColor,
          ),
          onPressed: () {
            callback(text);
          },
          child: Center(
            child: Text(text,
                style: GoogleFonts.ptSerif(fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,fontSize: 24,color: textColor)),
          ),

        ),
      ),
    );
  }
}
