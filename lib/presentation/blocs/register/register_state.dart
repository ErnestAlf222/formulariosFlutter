part of 'register_cubit.dart';


enum FormStatus { inValid, valid, validating, posting }

class RegisterFormState extends Equatable {
  
  final FormStatus formStatus;
  final bool isValid;
  final UserName username;
  final Email email;
  final Password password;

  const RegisterFormState({
    this.formStatus = FormStatus.inValid, 
    this.isValid =false,
    this.username =const UserName.pure(), 
    this.email    =const Email.pure(), 
    this.password =const Password.pure(),
    });

    RegisterFormState copyWith({
      FormStatus? formStatus,
      bool? isValid,
      UserName? username,
      Email? email,
      Password? password,
    }) => RegisterFormState(
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
      username: username ?? this.username,
      email   : email ?? this.email,
      password: password ?? this.password
    );

  @override
  List<Object> get props => [ formStatus, isValid, username, email, password ];

}
