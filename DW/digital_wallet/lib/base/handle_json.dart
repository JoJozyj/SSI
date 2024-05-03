import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; //导入dart:convert库来处理JSON数据

Future<void> saveJsonData(String jsonString) async {
  final preferences = await SharedPreferences.getInstance();
  preferences.setString('hashed_uid', jsonString); // 保存JSON字符串
}

Future<String?> getJsonData() async {
  final preferences = await SharedPreferences.getInstance();
  return preferences.getString('hashed_uid'); // 读取JSON字符串
}

// 将JSON对象转换为字符串，并保存
Future<void> saveJsonObject(Map<String, dynamic> jsonObject) async {
  final jsonString = json.encode(jsonObject); // 将JSON对象转换为字符串
  await saveJsonData(jsonString); // 保存JSON字符串
}

// 从存储中读取JSON字符串，并将其转换回对象
Future<Map<String, dynamic>?> getJsonObject() async {
  final jsonString = await getJsonData();
  return jsonString != null ? json.decode(jsonString) : null; // 将JSON字符串转换回对象
}

Future<Map<String, dynamic>?> getData(String? oriData) {
  if (oriData == null || oriData.isEmpty) {
    throw ArgumentError('JSON string cannot be null or empty.');
  }
  try {
    return jsonDecode(oriData);
  } on FormatException {
    throw ArgumentError('Invalid JSON format.');
  }
}


