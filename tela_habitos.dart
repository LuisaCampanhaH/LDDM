import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // o import é POR ARQUIVO
import 'habitos_store.dart';
import 'tela_detalhe.dart';

// Sem StatefulWidget e sem setState: quem manda redesenhar é o notifyListeners da loja.
class TelaHabitos extends StatelessWidget {
  const TelaHabitos({super.key});

  @override
  Widget build(BuildContext context) {
    // watch no build, para MOSTRAR: a tela se inscreve e reconstrói quando a loja avisa.
    final habitos = context.watch<HabitosStore>().habitos;

    return Scaffold(
      appBar: AppBar(title: const Text('Meus Hábitos')),
      body: habitos.isEmpty
          ? const Center(child: Text('Nenhum hábito ainda. Toque no + para adicionar.'))
          : ListView.builder(
              itemCount: habitos.length,
              itemBuilder: (context, i) {
                final h = habitos[i];
                return ListTile(
                  leading: Icon(h.icone),
                  title: Text(h.nome),
                  subtitle: Text(h.meta),
                  // Tela que depende de um item: push direto, com o dado no construtor.
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => TelaDetalhe(habito: h)),
                    );
                  },
                );
              },
            ),
      // O botão de ação principal é propriedade do Scaffold, não vai dentro do body.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/novo'); // rota nomeada, sem dado
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}