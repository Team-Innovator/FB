import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // GoogleFonts 패키지 임포트
import 'reco.dart'; // RecoPage 임포트

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INNOVENTURES',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'INNOVENTURES'),
      debugShowCheckedModeBanner: false,
    );
  }
}

// 주는것 - 카테고리
// 받는것 - 채널명 : 구독자 : 링크 : 카테고리

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _minSubscribersController =
      TextEditingController();
  final TextEditingController _maxSubscribersController =
      TextEditingController();

  void _showWarningDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('경고'),
          content: Text(message),
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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // 배경 흰색으로 설정
        title: Text(
          'INNOVENTURES', // 영문 제목
          style: GoogleFonts.oleoScript(
            fontSize: 34, // 글씨 크기 조절
            fontWeight: FontWeight.bold, // 글씨 두껍게
            color: Colors.black, // 글씨 색상은 검은색
          ),
        ),
        centerTitle: true, // 제목 가운데 정렬
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _minSubscribersController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '최소 구독자 수',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text('~'),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _maxSubscribersController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '최대 구독자 수',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _textController,
                maxLines: 15, // 텍스트 입력 칸 높이 조절
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '스타트업 아이템/서비스 내용',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_minSubscribersController.text.isEmpty ||
                    _maxSubscribersController.text.isEmpty) {
                  _showWarningDialog('구독자 수를 입력해주세요.');
                } else if (_textController.text.isEmpty) {
                  _showWarningDialog('텍스트를 입력해주세요.');
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RecoPage()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50, vertical: 20), // 버튼 크기 조절
              ),
              child: const Text('매칭하기',
                  style: TextStyle(fontSize: 20)), // 글씨 크기 조절
            ),
          ],
        ),
      ),
    );
  }
}
