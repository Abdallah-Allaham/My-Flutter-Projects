import 'package:just_audio/just_audio.dart';

class AudioService {
  final _player = AudioPlayer();

  Future<void> _play(String asset) async {
    await _player.setAsset(asset);
    await _player.play();
  }

  void ding()    => _play('assets/sounds/ding.mp3');
  void success() => _play('assets/sounds/success.mp3');
  void error()   => _play('assets/sounds/error.mp3');
}
