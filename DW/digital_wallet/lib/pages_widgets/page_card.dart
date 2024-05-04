import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../base/handle_json.dart';
import 'package:flutter/foundation.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  bool showAllCards = false;
  int itemCount = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('卡包',
        style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: showAllCards ? _buildAllCards() : _buildSingleCard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleCard() {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          showAllCards = true;
        });
      },
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.credit_card),
          title: const Text('Single Card'),
          subtitle: const Text('Long press to show all cards'),
        ),
      ),
    );
  }

  Widget _buildAllCards() {
    if (itemCount == 0) {
      return Center(
        child: Text(
          'No cards available.Please apply a new one using scan module to scan a QRcode.',
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          showAllCards = false;
        });
      },
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.credit_card),
              title: Text("Card ${index + 1}"),
              subtitle: Text("This is card number ${index + 1}"),
            ),
          );
        },
      ),
    );
  }
  }