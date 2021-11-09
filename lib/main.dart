import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mass Calculator',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Mass calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 final mass = TextEditingController();
 final height = TextEditingController();
 String message;
 double result;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           TextField(
             controller: mass,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20.0),
                labelText: 'mass'
              ),
           ),
            SizedBox(height: 20.0),
            TextField(

              controller: height,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20.0),

                labelText: 'height'
              ),
            ),
            FlatButton(onPressed: (){
                compute();
            },

            child: Text("Compute"),),
            Text(result.toString()),
            Text("$message")
          ],
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );

  }
  void compute(){
    setState(() {
      double weight = double.parse(mass.text);
      double heigh = double.parse(height.text);
       result = weight /(heigh*heigh);

      if(result >= 25.0){
        message = 'Overweight';
      }else if(25.0>result && 18.9<result){
        message = "Normal";
      }else{
        message = "Underweight";
      }
    });

  }
}
