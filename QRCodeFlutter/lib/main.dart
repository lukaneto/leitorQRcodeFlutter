import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Leitor QRcode',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title:'Leitor QRcode'),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) : super(key:key);
  final String title;
  _MyHomePageState createState()=> _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  void _captureQR(){
    Future<String> futureString = QRCodeReader().scan();
    futureString.then((qrText) => _showDialog(qrText));
  }

  void _showDialog(String	qrtext)	{
				showDialog(
						context:	context,
						builder:	(BuildContext	context)	{
								return	AlertDialog(
										title:	new	Text("Texto	do	QR	Code"),
										content:	new	Text(qrtext),
										actions:	<Widget>[
												new	FlatButton(
														child:	new	Text("Fechar"),
														onPressed:	()	{
																Navigator.of(context).pop();
														},
												),
										],
								);
						},
				);
		}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      title: Text(widget.title),

     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           RaisedButton(
             child: Text('Ler QR Code'),
             onPressed: (){
               _captureQR();
             },
           ),
         ],
       ),
     ),
    );
  }
}