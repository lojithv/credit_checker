
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'CREDIT CHECKER';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {


  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {

  var credit= "0";
  final myController = TextEditingController();

  checkCredit(txt){
    setState(() {
      var salary = int.parse(txt.text);
      if (salary>=120000){
        credit = "170000LKR";
        print(credit);
      }
      else if(salary>= 80000){
        credit = "130000LKR";
      }
      else if(salary>= 50000){
        credit = "100000LKR";
      }
      else {
        credit = "0LKR";
      }
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var txt = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 50, right: 50, top: 50),
          child: new TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter Your Salary',
            ),
            controller: txt,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            child: Text('ENTER'),
            onPressed: ()=>{
              checkCredit(txt)
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 200),
          child: Text(
            'Your Credit Balance : $credit',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
