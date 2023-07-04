import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';


class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const  BlocCounterView()
      );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key
  });

  void increasedCounterBy(BuildContext context,[int value = 1]) {
    context.read<CounterBloc>().add(
      CounterIncreased(value)
    );
  }
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: context.select((CounterBloc counterBloc ) => Text('Bloc counter: ${counterBloc.state.transactionCount}') ) ,
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(CounterReset()), 
            icon: const Icon(Icons.refresh_sharp)
          )
        ],
      ),
      body:  Center(
        child: context.select((CounterBloc counterBloc) => Text('Counter value: ${counterBloc.state.counter}')), 
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () => increasedCounterBy(context, 3),
          ),
          const SizedBox(height: 22 ),
          FloatingActionButton(
            heroTag: '2',
            child: const  Text('+2'),
            onPressed: () => increasedCounterBy(context, 2),
          ),
          const SizedBox(height: 22 ),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => increasedCounterBy(context, 1),
          ),
          const SizedBox(height: 25 ),
        ],
      ),
    );
  }
}