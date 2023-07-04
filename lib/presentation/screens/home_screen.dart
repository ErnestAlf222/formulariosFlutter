import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  [
          ListTile(
            title: const Text('Cubit'),
            subtitle: const Text('Provedor con cubits'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title: const Text('Bloc'),
            subtitle: const Text('Provedor con bloc'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/bloc'),
          ),
          const Padding(
            padding:EdgeInsets.symmetric(horizontal:10),
            child: Divider(),
          ),
          ListTile(
            title: const Text('Formularios'),
            subtitle: const Text('Manejo de formularios'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/register'),
          ),

        ],
      ),
    );
  }
}