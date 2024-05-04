import 'package:flutter/material.dart';
import '../assets/icons/my_icons.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../base/handle_json.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

int getVCsNum(){
  int num = 0;
  List vcs = [];
  int i;
  for(i=0;i<vcs.length;i++){
    num++;
  }
  return num;
}
void applyVC(){
  print("获得的VC");
}//生成DID,以及密钥对


class VCPage extends StatefulWidget{
  const VCPage({super.key});

  @override
  _VCPageState createState() => _VCPageState();
}
class _VCPageState extends State<VCPage> {
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
              Text('VCs', style: TextStyle(color: Colors.white),),
              IconButton(onPressed: (){
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    title: Text('温馨提示'),
                    content: Text('您确定要申请新的凭证吗？'),
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
                          applyVC;
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

