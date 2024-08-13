import 'package:flutter/material.dart';

class RecoPage extends StatefulWidget {
  final String keyword;
  final String reason;
  final int subscriberCount;
  final String title;

  const RecoPage({
    super.key,
    required this.keyword,
    required this.reason,
    required this.subscriberCount,
    required this.title,
  });

  @override
  _RecoPageState createState() => _RecoPageState();
}

class _RecoPageState extends State<RecoPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showSuccessDialog();
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('매칭 성공'),
          content: const Text('매칭 결과를 확인하세요.'),
          actions: <Widget>[
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('매칭 결과'),
        backgroundColor: Color.fromARGB(255, 245, 250, 251),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ExpansionTile(
                leading:
                    Icon(Icons.play_circle_fill, size: 40, color: Colors.teal),
                title: Text(widget.title,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                subtitle: Text(
                    '구독자 : ${widget.subscriberCount}명\n카테고리 : ${widget.keyword}',
                    style: TextStyle(fontSize: 16)),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('매칭 이유\n${widget.reason}'),
                  ),
                ],
                initiallyExpanded: false,
              ),
            ),
            Divider(thickness: 2),
          ],
        ),
      ),
    );
  }
}
