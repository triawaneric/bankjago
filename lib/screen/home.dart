import 'package:bank_jago/animation/EnterExitRoute.dart';
import 'package:bank_jago/screen/screen_1.dart';
import 'package:bank_jago/screen/screen_2.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.white70,
      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        brightness: Brightness.dark,
      ),

      //
      body: Column(
          children: <Widget>[

            ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(
                color: Colors.blueAccent,
                width: double.infinity,
                height: 180,



            //Counting
                alignment: Alignment.center,
                //Header
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //1

                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 2
                        ),
                        color: Colors.white,
                      ),
                      child: new Text("1", style: new TextStyle(color: Colors.black, fontSize: 18.0)),
                      //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                    ),//............

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
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        //borderRadius: new BorderRadius.circular(30.0),
                        border: Border.all(
                            width: 2
                        ),
                        color: Colors.white,
                      ),
                      child: new Text("2", style: new TextStyle(color: Colors.black, fontSize: 18.0)),
                      //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                    ),//.........

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
                      padding: const EdgeInsets.all(20.0),//I used some padding without fixed width and height
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,// You can use like this way or like the below line
                        //borderRadius: new BorderRadius.circular(30.0),
                        border: Border.all(
                            width: 2
                        ),
                        color: Colors.white,

                      ),
                      child: new Text("3", style: new TextStyle(color: Colors.black, fontSize: 18.0)),// You can add a Icon instead of text also, like below.
                      //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                    ),//.........

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
                      padding: const EdgeInsets.all(20.0),//I used some padding without fixed width and height
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,// You can use like this way or like the below line
                        //borderRadius: new BorderRadius.circular(30.0),
                        border: Border.all(
                            width: 2
                        ),
                        color: Colors.white,
                      ),
                      child: new Text("4", style: new TextStyle(color: Colors.black, fontSize: 18.0)),// You can add a Icon instead of text also, like below.
                      //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                    ),//.........

                  ],
                ),
              ),
            ),



            //Gritting

            //InputText
            Expanded(
              child:ListView(

                children: <Widget>[
                  //Gretting Title
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                          text: 'Welcome to\nGIN',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                          fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(text: ' Finans',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 30),

                            )
                          ]
                      ),
                    ),
                  ),

                  //Gretting Description
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text("Welcome to The Bank of The Future. Manage and track your accounts on the go.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),),
                  ),

                  //Input
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: Container(
                    padding:EdgeInsets.all(20) ,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child:Container(
                      padding: EdgeInsets.all(10),
                        child: Theme(
                          data: Theme.of(context).copyWith(splashColor: Colors.red),
                      child: TextFormField(
                    autocorrect: false,
                    validator: validateEmail,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)),
                      ),

                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                      ),
                    ),
                  ),
                    ),
                  ),
                  ),

                ],
              ),
              ),



            //Button Next
            Flexible(
              flex: 0,
              child: Container(
              margin: EdgeInsets.all(10),
              child: Align(
              alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  height: 58,
                  minWidth: double.infinity,
                  onPressed: () {
                    //Move to New Page
                    Navigator.push(context,
                        EnterExitRoute(exitPage:Home(), enterPage: Screen1()));

                  },
                  child: const Text('Next', style: TextStyle(fontSize: 20)),
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  elevation: 5,
                ),
              ),
            ),),
          ],
        ),


    );
  }


  String validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    else
      return null;
  }

}


//Costom CLipper class with Path
class BottomWaveClipper extends CustomClipper<Path> {
  @override

  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 9, size.height - 60, size.width / 2, size.height - 20);
    path.quadraticBezierTo(size.width - (size.width / 6), size.height,
        size.width, size.height - 0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
  @override

  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}