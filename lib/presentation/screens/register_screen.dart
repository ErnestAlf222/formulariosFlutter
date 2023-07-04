import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';

import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Nuevo usuario'),
      ),
      body:  BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100),
              SizedBox(height: 50),
              _RegisterForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final userName = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
        // key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombre: ${userName.value}',
              onChanged: registerCubit.usernameChanged,
              errorMessage: userName.errorMessage,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Correo electrónico',
              onChanged: registerCubit.emailChanged,
              errorMessage: email.errorMessage,
              
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              label: 'Contraseña: ${password.value}',
              obscureText: true,
             onChanged: registerCubit.passwordChanged,
              errorMessage: password.errorMessage,
            ),
            const SizedBox(height: 20),
            FilledButton.tonalIcon(
              label: const Text('Crear usuario'),
              icon: const Icon(Icons.save),
              onPressed: () {
                
                registerCubit.onSubmit();
              },
            ),
          ],
        ));
  }
}
