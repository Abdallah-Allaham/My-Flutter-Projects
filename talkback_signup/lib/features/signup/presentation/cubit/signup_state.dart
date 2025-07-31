part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  @override
  List<Object?> get props => [];
}
class PhoneInput  extends SignupState {}
class OtpWaiting  extends SignupState {}
class OtpInput    extends SignupState {}
