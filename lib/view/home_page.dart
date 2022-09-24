import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'bottoms_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _expression = '';

  @override
  void initState() {
    _expression = '0';
    super.initState();
  }

  void numberClicks(String text){
    setState(() {
      _expression += text;
    });
  }
  void allClear(String text){
    setState(() {
      _expression = '';
    });
  }
  void evaluate(String text){
    setState(() {
      try{
        Parser p = Parser();
      Expression exp = p.parse(_expression.replaceAll('x', '*'));
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      _expression = eval.toString();
      }catch(e){
        _expression = 'Error';
      }

    });
  }

  void percentage(String text){
    var percent = double.parse(_expression)/100;
    setState(() {
      _expression = percent.toString();
    });
  }
  void odd(String text){

    setState(() {
      _expression = _expression.substring(0, _expression.length - 1);
      if (_expression == "") {
        _expression = "0";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(right: 40),
            child: Text(_expression,style: GoogleFonts.ptSerif(fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,fontSize: 48,
                color: Colors.white),),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton(text: 'AC', textColor: Colors.black, buttonColor: Colors.grey,callback:allClear),
              CalcButton(text: 'C', textColor: Colors.black, buttonColor: Colors.grey,callback:odd),
              CalcButton(text: '%', textColor: Colors.black, buttonColor: Colors.grey,callback:percentage),
              CalcButton(text: '/', textColor: Colors.white, buttonColor: const Color(0xffEFA803),callback:numberClicks),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton(text: '7', textColor: Colors.white, buttonColor: const Color(0xff2C2C2A),callback:numberClicks),
              CalcButton(text: '8', textColor: Colors.white, buttonColor: const Color(0xff2C2C2A),callback:numberClicks),
              CalcButton(text: '9', textColor: Colors.white, buttonColor: const Color(0xff2C2C2A),callback:numberClicks),
              CalcButton(text: 'x', textColor: Colors.white, buttonColor: const Color(0xffEFA803),callback:numberClicks),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton(text: '4', textColor: Colors.white, buttonColor: const Color(0xff2C2C2A),callback:numberClicks),
              CalcButton(text: '5', textColor: Colors.white, buttonColor: const Color(0xff2C2C2A),callback:numberClicks),
              CalcButton(text: '6', textColor: Colors.white, buttonColor: const Color(0xff2C2C2A),callback:numberClicks),
              CalcButton(text: '-', textColor: Colors.white, buttonColor: const Color(0xffEFA803),callback:numberClicks),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalcButton(text: '1', textColor: Colors.white, buttonColor: const Color(0xff2C2C2A),callback:numberClicks),
              CalcButton(text: '2', textColor: Colors.white, buttonColor: const Color(0xff2C2C2A),callback:numberClicks),
              CalcButton(text: '3', textColor: Colors.white, buttonColor: const Color(0xff2C2C2A),callback:numberClicks),
              CalcButton(text: '+', textColor: Colors.white, buttonColor: const Color(0xffEFA803),callback:numberClicks),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 65,
                width: 182,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)
                    ),
                    primary: const Color(0xff2C2C2A),
                  ),
                  onPressed: () {
                    return numberClicks('0');
                  },
                  child: const Text('0',
                    style: TextStyle(color: Colors.white,fontSize: 30),),

                ),
              ),
              CalcButton(text: '.', textColor: Colors.white, buttonColor: const Color(0xff2C2C2A),callback:numberClicks),
              CalcButton(text: '=', textColor: Colors.white, buttonColor: const Color(0xffEFA803),callback:evaluate),

            ],
          ),
        ],
      ),
    );
  }
}
