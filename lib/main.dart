import 'package:flutter/material.dart';

void main()
{
  runApp(icon());
}

class icon extends StatelessWidget{
  Widget build(context){
    return MaterialApp(
      home:cal(),
      routes: <String,WidgetBuilder>{
        '/Ico':(Context)=>Ico()

      }

    );


  }
}

class cal extends StatefulWidget{
  createState(){
    return(calc());
  }
}
@override
class calc extends State<cal> {
  String output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String output1 = "0";
  String operand = "";

//String t='Happy Life';
  void Click(String button) {
    if (button == "C") {
      num1 = 0.0;
      num2 = 0.0;
      output1 = "0";
      operand = "";
    }
    else if (button == "+" || button == "-" || button == "x" || button == "/") {
      num1 = double.parse(output);
      operand = button;
      output1 = "0";
    }
    else if (button == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        output1 = (num1+num2).toString();
      }
      if (operand == "-") {
        output1 = (num1 - num2).toString();
      }
      if (operand == "x") {
        output1 = (num1 * num2).toString();
      }
      if (operand == "/") {
        output1 = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
      else{
        output1=output1+button;
      }
      print(output1);
      setState(() {
        output = double.parse(output1).toStringAsFixed(1);
      });
    }


    @override
    Widget build(BuildContext context) {
      return MaterialApp(
          home: Scaffold(
              backgroundColor:Colors.white30,
              appBar: AppBar(
                title: Text("Calculator",),
                backgroundColor: Colors.black45,
                leading: Icon(Icons.code),
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.history), onPressed: ()
                  {
                    Navigator.pushNamed(context, '/Ico');

                  })
                ],
              ),

              body: Container(

                child: Column(
                    children: <Widget>[
                      Container(
                        /*decoration: new BoxDecoration(
                          image:new DecorationImage(
                              image: new AssetImage(
                                  "assets/images/calculator-a-background-vector-2021480.jpg"
                              ),
                          fit:BoxFit.cover,
                          ),
                        ),*/
                        alignment: Alignment.centerRight,
                        child: Text(output, style: TextStyle(fontSize: 50.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,),),

                      ),
                      new Expanded(
                        child: new Divider(),
                      ),
                      Row(children: [
                        buildButton("7"),
                        buildButton("8"),
                        buildButton("9"),
                        buildButton("/"),
                      ]),
                      Row(children: [
                        buildButton("4"),
                        buildButton("5"),
                        buildButton("6"),
                        buildButton("x"),
                      ]),
                      Row(children: [
                        buildButton("1"),
                        buildButton("2"),
                        buildButton("3"),
                        buildButton("+"),
                      ]),
                      Row(children: [
                        buildButton("C"),
                        buildButton("0"),
                        buildButton("="),
                        buildButton("-"),
                      ])


                    ]
                ),


              )

          )


      );
    }
    @override
    Widget buildButton(String button) {

        return Padding(
          padding: const EdgeInsets.all(5.0),

          child: RawMaterialButton(
            shape:const CircleBorder(),
            constraints: BoxConstraints.tight(Size(80.0, 80.0)),
            highlightColor: Colors.amber,
            splashColor: Colors.purple,
            onPressed: (){
              setState(() {
                Click(button);
              });
            },
            child: Text(button,

              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold,color: Colors.pink),),
              fillColor:Colors.black,
          ),


        );



    }

}

class Ico extends StatelessWidget{
  @override
  Widget build(context){
    return Scaffold(
      appBar:AppBar(
        title:Text("History"),
            centerTitle:true,
      ),
         /* body:Container(
        child:Row(
        children: <Widget>[
    RaisedButton(onPressed:(){},child:Text("Add and Sub"),)
    ],



    )*/
    );

  }
}





