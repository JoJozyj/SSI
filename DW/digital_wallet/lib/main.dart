import 'package:flutter/material.dart';
import './assets/icons/my_icons.dart';
import './pages_widgets/page_scan.dart';
import './pages_widgets/page_card.dart';
import './pages_widgets/page_DIDs.dart';
import './pages_widgets/page_setting.dart';
import './pages_widgets/page_VCs.dart';

void main() {
  runApp(DigitalWalletApp());
}

class DigitalWalletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: DigitalWalletHomePage(),
    );
  }
}
class DigitalWalletHomePage extends StatefulWidget{
  @override
  _DigitalWalletHomePage createState() => _DigitalWalletHomePage();
}

class _DigitalWalletHomePage extends State<DigitalWalletHomePage> {
  int _currentIndex = 0;
  final _pageList = [
    DIDPage(),
    VCPage(),
    QRScannerPage(),
    CardPage(),
    SettingPage(),];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Digital_Wallet",
        style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body:  _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
            BottomNavigationBarItem(
                icon: Icon(
                  MyIcons.DID,
                  size: 18,
                ),
                label: 'DIDs',
              ),
          BottomNavigationBarItem(
            icon: Icon(
              MyIcons.VC,
              size: 18,
            ),
            label: 'VCs',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MyIcons.Scan,
              size: 18,
            ),
            label: '扫一扫',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MyIcons.Card,
              size: 18,
            ),
            label: '身份卡',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MyIcons.Setting,
              size: 18,
            ),
            label: '设置',
          ),
      ],
        selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,


      ),

    );}}



