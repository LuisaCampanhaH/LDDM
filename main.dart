import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'habitos_store.dart';
import 'tela_novo_habito.dart';
import 'tela_principal.dart';

// O provider fica ACIMA do aplicativo (não dentro de uma tela): é essa posição
// que faz a loja sobreviver à navegação e ficar visível para todas as telas.
void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => HabitosStore(),
        child: const MeuApp(),
      ),
    );

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Diário de Hábitos',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A5276)),
          useMaterial3: true,
        ),
        // initialRoute substitui o home: não use os dois juntos.
        initialRoute: '/',
        // Rotas nomeadas: só para telas que NÃO dependem de um dado.
        // A TelaDetalhe precisa de um hábito, por isso NÃO entra aqui:
        // ela é aberta com push direto, com o dado no construtor.
        routes: {
          '/': (context) => const TelaPrincipal(),
          '/novo': (context) => const TelaNovoHabito(),
        },
      );
}