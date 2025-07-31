import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/signup_cubit.dart';

class PhoneStep extends StatelessWidget {
  PhoneStep({super.key});
  final _ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _ctrl,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(labelText:'رقم الهاتف'),
          onSubmitted: (v)=> context.read<SignupCubit>().onPhoneSubmitted(v),
        ),
        const SizedBox(height:12),
        ElevatedButton(
          onPressed: ()=> context.read<SignupCubit>().onPhoneSubmitted(_ctrl.text),
          child: const Text('التالي'),
        ),
      ],
    );
  }
}
