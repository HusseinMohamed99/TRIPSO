import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts flutterTts = FlutterTts();

speak(String text) async {
  await flutterTts.setLanguage("en-Eg");
  await flutterTts.setPitch(1);
  await flutterTts.speak(text);
  flutterTts.setCancelHandler(() {
    flutterTts.pause();
  });
}
