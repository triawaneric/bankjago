import 'package:bank_jago/animation/EnterExitRoute.dart';
import 'package:bank_jago/screen/home.dart';
import 'package:bank_jago/screen/screen_2.dart';
import 'package:bank_jago/utils/password_strength.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Screen1 extends StatefulWidget{

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen1> with TickerProviderStateMixin{

  int _currentStep = 0;
  String _password;
  bool _obscureText = true;
  var _passwordController = TextEditingController();

  TextEditingController textController = TextEditingController();

  AnimationController _controller1;
  AnimationController _controller2;
  AnimationController _controller3;
  AnimationController _controller4;
  Animation<double> _fabScale1;
  Animation<double> _fabScale2;
  Animation<double> _fabScale3;
  Animation<double> _fabScale4;

  bool nineChars = false;
  bool upperCaseChar = false;
  bool lowerCaseChar = false;
  bool number = false;
  String passwordMeter = "";

  bool visibilityTagNine = true;
  bool visibilityTagUpper = true;
  bool visibilityTagLower = true;
  bool visibilityTagNumber = true;


  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  StepperType stepperType = StepperType.horizontal;

  @override
  void initState() {
    super.initState();

    textController.addListener(() {
      setState(() {
        nineChars = textController.text.length >= 9;
        number = textController.text.contains(RegExp(r'\d'), 0);
        upperCaseChar = textController.text.contains(new RegExp(r'[A-Z]'), 0);
        lowerCaseChar = textController.text.contains(new RegExp(r'[a-z]'), 0);
      });

      //Strength Meter

      double strength = estimatePasswordStrength(textController.text);

      // Print a response
      if(textController.text != null || textController.text.length != 0){
        if (strength < 0.3) {
          passwordMeter = 'Weak!';
        } else if (strength < 0.7) {
          passwordMeter = 'Medium!';
        } else {
          passwordMeter = 'Strong!';
        }
      }



      //Lower
      if (_lowerValid()) {
        visibilityTagLower = false;
        _controller1.forward();

      } else {
        visibilityTagLower = true;
        _controller1.reverse();
      }
      //Upper
      if (_upperValid()) {
        visibilityTagUpper = false;
        _controller2.forward();

      } else {
        visibilityTagUpper = true;
        _controller2.reverse();
      }

      //Number
      if (_numberValid()) {
        visibilityTagNumber = false;
        _controller3.forward();
      } else {
        visibilityTagNumber = true;
        _controller3.reverse();
      }

      //9Char
      if (_minCharValid()) {
        visibilityTagNine = false;
        _controller4.forward();
      } else {
        visibilityTagNine = true;
        _controller4.reverse();
      }
    });

    //
    _controller1 = AnimationController(vsync: this,
        duration: const Duration(milliseconds: 500));
    _controller2 = AnimationController(vsync: this,
        duration: const Duration(milliseconds: 500));
    _controller3 = AnimationController(vsync: this,
        duration: const Duration(milliseconds: 500));
    _controller4 = AnimationController(vsync: this,
        duration: const Duration(milliseconds: 500));

    _fabScale1 = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller1, curve: Curves.bounceOut));

    _fabScale1.addListener((){
      setState(() {

      });
    });


    //2
    _fabScale2 = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller2, curve: Curves.bounceOut));

    _fabScale2.addListener((){
      setState(() {

      });
    });

    //3

    _fabScale3 = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller3, curve: Curves.bounceOut));

    _fabScale3.addListener((){
      setState(() {

      });
    });


    //4

    _fabScale4 = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller4, curve: Curves.bounceOut));

    _fabScale4.addListener((){
      setState(() {

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.blueAccent,
        //AppBar
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(context,
                  EnterExitRoute(exitPage: Screen1(), enterPage: Home()));
            },
          ),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0.0,
          brightness: Brightness.dark,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(

            'Create Account',
            style: TextStyle(
              color: Colors.white, // 3
            ),
          ),),
        ),
        //Body
        body: Container(
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  //Counting



                  //SIZE BOX
                  SizedBox(
                    height: 100.0,
                  ),
                  //Steper
                  Container(
                    alignment: Alignment.center,
                    //Header
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //1

                        Container(
                          padding: const EdgeInsets.all(20.0),
                          //I used some padding without fixed width and height
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            // You can use like this way or like the below line
                            //borderRadius: new BorderRadius.circular(30.0),
                            color: Colors.green,
                            border: Border.all(
                                width: 2
                            ),
                          ),
                          child: new Text("1", style: new TextStyle(
                              color: Colors.black,
                              fontSize: 18.0)), // You can add a Icon instead of text also, like below.
                          //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                        ), //............

                        //divider
                        Container(


                          width: 30.0,
                          height: 5,
                          color: Colors.black,
                        ),

                        //2
                        Container(
                          //width: 50.0,
                          //height: 50.0,
                          padding: const EdgeInsets.all(20.0),
                          //I used some padding without fixed width and height
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            // You can use like this way or like the below line
                            //borderRadius: new BorderRadius.circular(30.0),
                            color: Colors.white,
                            border: Border.all(
                                width: 2
                            ),
                          ),
                          child: new Text("2", style: new TextStyle(
                              color: Colors.black,
                              fontSize: 18.0)), // You can add a Icon instead of text also, like below.
                          //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                        ), //.........

                        //divider
                        Container(


                          width: 30.0,
                          height: 5,
                          color: Colors.black,
                        ),

                        //3
                        Container(
                          //width: 50.0,
                          //height: 50.0,
                          padding: const EdgeInsets.all(20.0),
                          //I used some padding without fixed width and height
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            // You can use like this way or like the below line
                            //borderRadius: new BorderRadius.circular(30.0),
                            color: Colors.white,
                            border: Border.all(
                                width: 2
                            ),
                          ),
                          child: new Text("3", style: new TextStyle(
                              color: Colors.black,
                              fontSize: 18.0)), // You can add a Icon instead of text also, like below.
                          //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                        ), //.........

                        //divider
                        Container(


                          width: 30.0,
                          height: 5,
                          color: Colors.black,
                        ),

                        //4
                        Container(

                          //width: 50.0,
                          //height: 50.0,
                          padding: const EdgeInsets.all(20.0),
                          //I used some padding without fixed width and height
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            // You can use like this way or like the below line
                            //borderRadius: new BorderRadius.circular(30.0),
                            color: Colors.white,
                            border: Border.all(
                                width: 2
                            ),
                          ),
                          child: new Text("4", style: new TextStyle(
                              color: Colors.black,
                              fontSize: 18.0)), // You can add a Icon instead of text also, like below.
                          //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                        ), //.........

                      ],
                    ),
                  ),


                  //Gritting

                  //InputText
                  Expanded(
                    child: ListView(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              //Gretting Title


                              //Gretting Description
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child:Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Create Password",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child:Align(
                                  alignment: Alignment.centerLeft,

                                  child: Text("Password will be used to login to account",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),),),
                              Form (
                                // autovalidateMode: AutovalidateMode.always,
                                child: Container(
                                  margin: EdgeInsets.all(20),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(splashColor: Colors
                                        .white),
                                    child: TextField(
                                      controller: textController,
                                      obscureText: _obscureText,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText:"Create Password",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureText
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                          onPressed: _toggle,
                                          color: Colors.blue,
                                        ),
                                      ),

                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),


                          Container(
                            margin: EdgeInsets.all(20),
                            alignment: Alignment.centerLeft,
                            child: Text("Complexity:" +passwordMeter,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),

                          //Icon
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                //Icon Lowercase
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    children:<Widget> [

                                      //Validate
                                      Visibility(
                                        visible: lowerCaseChar,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Transform.scale(
                                            scale: _fabScale1.value,
                                            child: Card(
                                              shape: CircleBorder(),
                                              color: Colors.green,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //Icon
                                      Visibility(
                                        visible: visibilityTagLower,
                                        child: Text("a",
                                          style: TextStyle(
                                              fontSize: 28,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                      //Title
                                      Text("Lowercase",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),)
                                    ],
                                  ),
                                ),

                                //Icon Uppercase
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    children:<Widget> [

                                      //Validate
                                      Visibility(
                                        visible: upperCaseChar,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Transform.scale(
                                            scale: _fabScale2.value,
                                            child: Card(
                                              shape: CircleBorder(),
                                              color: Colors.green,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //Icon
                                      Visibility(
                                        visible: visibilityTagUpper,
                                        child: Text("A",
                                          style: TextStyle(
                                              fontSize: 28,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                      //Title
                                      Text("Uppercase",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),)
                                    ],
                                  ),
                                ),

                                //Number
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    children:<Widget> [

                                      //Vlidate
                                      Visibility(
                                        visible: number,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Transform.scale(
                                            scale: _fabScale3.value,
                                            child: Card(
                                              shape: CircleBorder(),
                                              color: Colors.green,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //Icon
                                      Visibility(
                                        visible: visibilityTagNumber,
                                        child: Text("123",
                                          style: TextStyle(
                                              fontSize: 28,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                      //Title
                                      Text("Number",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),)
                                    ],
                                  ),
                                ),

                                //Character

                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    children:<Widget> [
                                      Visibility(
                                        visible: nineChars,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Transform.scale(
                                            scale: _fabScale4.value,
                                            child: Card(
                                              shape: CircleBorder(),
                                              color: Colors.green,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //Icon
                                      Visibility(
                                        visible: visibilityTagNine,
                                        child: Text("9+",
                                          style: TextStyle(
                                              fontSize: 32,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                      //Title
                                      Text("Characters",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),)
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),

                        ],
                      )
                  ),


                  //Button Next
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Align(
                      child: MaterialButton(
                        height: 58,
                        minWidth: double.infinity,
                        onPressed: () {
                          //Move to New Page
                          Navigator.push(context,
                              EnterExitRoute(
                                  exitPage: Screen1(), enterPage: Screen2()));
                        },
                        child: const Text('Next', style: TextStyle(
                            fontSize: 20)),
                        color: Colors.lightBlue,
                        textColor: Colors.white,
                        elevation: 5,
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        );
  }

    //Backpress
    Future<bool> _onBackPressed() {
      Navigator.pushReplacement(context,
          EnterExitRoute(exitPage: Screen1(), enterPage: Home()));
    }






  bool _upperValid() {
    return  upperCaseChar ;
  }

  bool _lowerValid() {
    return  lowerCaseChar ;
  }

  bool _numberValid() {
    return  number ;
  }

  bool _minCharValid() {

    return  nineChars ;
  }
}




