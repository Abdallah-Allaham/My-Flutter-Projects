import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final _tts = FlutterTts()..setLanguage('ar');

  Future<void> speak(String text) async {
    await _tts.stop();
    await _tts.setSpeechRate(0.5);
    await _tts.speak(text);
  }

  Future<void> stop() => _tts.stop();
}
