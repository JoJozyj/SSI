import 'package:flutter/material.dart';

class NetworkSettingsPage extends StatefulWidget {
  @override
  _NetworkSettingsPageState createState() => _NetworkSettingsPageState();
}

class _NetworkSettingsPageState extends State<NetworkSettingsPage> {
  String _baseUrl = '';
  bool _useHttps = true;
  bool _isLoading = false;

  void _saveSettings() {
    setState(() {
      _isLoading = true;
    });

    // 假设我们在这里保存设置
    // 一些异步操作，比如网络请求

    // 完成后设置加载完成状态为false
    Future.delayed(Duration(seconds: 2)).then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网络设置'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: '基础URL',
                hintText: '例如 https://api.example.com',
              ),
              onChanged: (value) {
                setState(() {
                  _baseUrl = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                Text('使用HTTPS'),
                Checkbox(
                  value: _useHttps,
                  onChanged: (bool? value) {
                    if (value != null) {
                      setState(() {
                        _useHttps = value;
                      });
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('保存'),
              onPressed: () {
                _saveSettings();
              },
            ),
          ],
        ),
      ),
    );
  }
}