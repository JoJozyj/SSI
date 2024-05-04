import 'package:digital_wallet/assets/icons/my_icons.dart';
import 'package:flutter/material.dart';
import './page_setting_net.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('网络配置'),
            leading: const Icon(MyIcons.Add),
            onTap: () {
              // 打开网络配置页面或显示网络配置表单
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NetworkSettingsPage()),
              );
            },
          ),
          ListTile(
            title: const Text('账户安全'),
            leading: const Icon(Icons.lock),
            onTap: () {
              // 打开账户安全页面或显示账户安全表单
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('账户安全'),
                  content: const Text('这里是账户安全设置'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('确定'),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text('清除缓存'),
            leading: const Icon(Icons.delete),
            onTap: () {
              // 清除缓存的逻辑
              showSnackBar(context, '缓存已清除');
            },
          ),
          // 可以继续添加其他设置项...
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}