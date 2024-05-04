import 'package:flutter/material.dart';
import '../assets/icons/my_icons.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../base/handle_json.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

int getDIDNum(){
  int num = 0;
  List dids = [];
  int i;
  for(i=0;i<dids.length;i++){
    num++;
  }
  return num;
}
void generateDID(){
  print("获得的DID");
}//生成DID,以及密钥对


class DIDPage extends StatefulWidget{
  const DIDPage({super.key});

  @override
  _DIDPageState createState() => _DIDPageState();
}
class _DIDPageState extends State<DIDPage> {
  void onPressed(){}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('DIDs', style: TextStyle(color: Colors.white),),
              IconButton(onPressed: (){
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    title: Text('温馨提示'),
                    content: Text('您确定要生成新的DID吗？'),
                    actions: [
                    TextButton(
                    child: Text('取消'),
                    onPressed: () {
                    Navigator.pop(context);
                    },
                    ),
                    TextButton(
                    child: Text('确定'),
                    onPressed: () {
                    // 这里可以执行确定后的操作
                    generateDID;
                    Navigator.pop(context);
                    },
                    ),
                    ],
                  );
                  },
                );
              }, icon: Icon(MyIcons.Add,
              color: Colors.white,)),
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('List Item 1'),
            ),
            Divider(),
            ListTile(
              title: Text('List Item 2'),
            ),
            Divider(),
            // ... 更多的ListTile和Divider ...
          ],
        ),
      ),
      );
    }
  }

