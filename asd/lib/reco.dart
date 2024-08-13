import 'package:flutter/material.dart';

class RecoPage extends StatelessWidget {
  const RecoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('매칭 결과'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
                title: Text('인플루언서 A',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                subtitle:
                    Text('구독자: 0명\n카테고리: 게임', style: TextStyle(fontSize: 16)),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('매칭 이유: 인플루언서 A는 게임 카테고리에서 높은 인기를 얻고 있습니다.'),
                  ),
                ],
                initiallyExpanded: false,
              ),
            ),
            Divider(thickness: 2),
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ExpansionTile(
                leading: Icon(Icons.tiktok, size: 40, color: Colors.teal),
                title: Text('인플루언서 B',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                subtitle:
                    Text('구독자: 0명\n카테고리: 음식', style: TextStyle(fontSize: 16)),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('매칭 이유: 인플루언서 B는 음식 카테고리에서 높은 평가를 받고 있습니다.'),
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
