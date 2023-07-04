import 'package:formz/formz.dart';


enum UserNameError { empty, length }

class UserName extends FormzInput<String, UserNameError> {
  // Call super.pure to represent an unmodified form input.
  const UserName.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UserName.dirty( String value ) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == UserNameError.empty) return 'El campo es requerido';
    if (displayError == UserNameError.length) return 'Mínimo 6 caracteres';
    
    return null;
  }

  @override
  UserNameError? validator(String value) {
    if ( value.isEmpty || value.trim().isEmpty) return UserNameError.empty;
    if ( value.length < 6 ) return UserNameError.length;

    return null;
  }
}