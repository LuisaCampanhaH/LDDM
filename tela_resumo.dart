import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'habitos_store.dart';

class TelaResumo extends StatelessWidget {
  const TelaResumo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resumo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Não depende da loja: não precisa ser reconstruído.
            const Icon(Icons.bar_chart),
            const SizedBox(height: 8),
            // Consumer reconstrói só este pedaço quando a loja notifica.
            // O número muda sozinho quando você adiciona um hábito na outra aba.
            Consumer<HabitosStore>(
              builder: (context, loja, filho) => Text(
                '${loja.habitos.length} hábitos',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}