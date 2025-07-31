import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../core/services/tts_service.dart';
import '../../../../core/services/audio_service.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._tts, this._audio) : super(PhoneInput()) {
    //_tts.speak('من فضلك أدخل رقم هاتفك');
  }

  final TtsService _tts;
  final AudioService _audio;
  late String _otpCode;

  /* خطوة الهاتف */
  Future<void> onPhoneSubmitted(String phone) async {
    emit(OtpWaiting());
    _otpCode = (100000 + Random().nextInt(899999)).toString();
    print('OTP: $_otpCode');                // يظهر في الـ console

    await SmsAutoFill().unregisterListener();
    await SmsAutoFill().listenForCode();

    _tts.speak('أرسلنا رمز التحقق، سيتم ملؤه تلقائيًا');
    emit(OtpInput());
  }

  /* خطوة OTP */
  void onOtpCompleted(String code) {
    if (code == _otpCode) {
      _audio.success();
      _tts.speak('تم التحقق بنجاح، تابع');
      // TODO: emit(NameInput()) لاحقًا
    } else {
      _audio.error();
      _tts.speak('الكود غير صحيح، حاول مرة أخرى');
    }
  }
}
