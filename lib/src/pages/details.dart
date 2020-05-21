


import 'package:api_to_sqlite_flutter/src/models/employee_model.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {

  final Employee itemHol ;

  Details({Key key, @required this.itemHol}) : super(key: key);

  goBack(BuildContext context){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Employee details Screen"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child:
              Text('Selected Employee = ' + itemHol.website,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,),

              ),



              RaisedButton(
                onPressed: () {goBack(context);},
                color: Colors.lightBlue,
                textColor: Colors.white,
                child: Text('Go Back To Previous Screen'),
              )])
    );
  }

}