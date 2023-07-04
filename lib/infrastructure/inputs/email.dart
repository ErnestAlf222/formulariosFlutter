import 'package:formz/formz.dart';


enum EmailError { empty, format }

class Email extends FormzInput<String, EmailError> {
  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty( String value ) : super.dirty(value);

  static final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailError.empty) return 'El campo es requerido';
    if (displayError == EmailError.format) return 'No tiene  formato de correo electrónico';
    
    return null;
  }

  @override
  EmailError? validator(String value) {

    if ( value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if ( !emailRegExp.hasMatch(value)) return EmailError.format;
    

    return null;
  }
}