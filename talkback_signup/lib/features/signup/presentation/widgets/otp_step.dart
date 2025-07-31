import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../cubit/signup_cubit.dart';

class OtpStep extends StatefulWidget {
  const OtpStep({super.key});

  @override
  State<OtpStep> createState() => _OtpStepState();
}

class _OtpStepState extends State<OtpStep> with CodeAutoFill {
  @override
  void codeUpdated() {
    if (code != null && code!.length == 6) {
      context.read<SignupCubit>().onOtpCompleted(code!);
    }
  }

  @override
  void initState() {
    super.initState();
    listenForCode();
  }

  @override
  Widget build(BuildContext context) {
    return PinFieldAutoFill(
      codeLength: 6,
      onCodeSubmitted: (c)=> context.read<SignupCubit>().onOtpCompleted(c),
      onCodeChanged: (c){},
    );
  }
}
