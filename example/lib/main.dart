import 'dart:async';

import 'package:example/chat_completion_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tl_flutter_openai/tl_flutter_openai.dart';

Future<void> main() async {
  await dotenv.load();

  final openAI = OpenAI(
    apiKey: dotenv.env['OPENAI_API_KEY'] ?? '',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const  ChatCompletionScreen(),
      themeMode: ThemeMode.dark,
    );
  }
}
