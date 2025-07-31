import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/tts_service.dart';
import '../../../../core/services/audio_service.dart';
import '../cubit/signup_cubit.dart';
import '../widgets/phone_step.dart';
import '../widgets/otp_step.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(TtsService(), AudioService()),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إنشاء حساب')),
      body: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          if (state is PhoneInput)   return PhoneStep();
          if (state is OtpInput
              || state is OtpWaiting) return const OtpStep();
          return const Center(child: Text('مرحلة غير مُنفَّذة بعد'));
        },
      ),
    );
  }
}
