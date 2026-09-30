import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'habito.dart';
import 'habitos_store.dart';

// Continua Stateful: os controllers moram no State e precisam de dispose.
class TelaNovoHabito extends StatefulWidget {
  const TelaNovoHabito({super.key});

  @override
  State<TelaNovoHabito> createState() => _TelaNovoHabitoState();
}

class _TelaNovoHabitoState extends State<TelaNovoHabito> {
  final _chave = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _meta = TextEditingController();

  @override
  void dispose() {
    _nome.dispose();
    _meta.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A seta de voltar vem de graça: a tela foi empilhada com push.
      appBar: AppBar(title: const Text('Novo hábito')),
      body: Column(
        children: [
          const SizedBox(height: 16),
          // Margem lateral de 16 nos dois lados: SizedBox + Expanded dentro de uma Row.
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Form(
                  key: _chave,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nome,
                        decoration: const InputDecoration(
                          labelText: 'Nome do hábito',
                          border: OutlineInputBorder(),
                        ),
                        validator: (valor) {
                          if (valor == null || valor.trim().isEmpty) {
                            return 'Informe o nome';
                          }
                          if (valor.trim().length < 3) {
                            return 'Use ao menos 3 letras';
                          }
                          return null; // null significa válido
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _meta,
                        decoration: const InputDecoration(
                          labelText: 'Meta',
                          border: OutlineInputBorder(),
                        ),
                        validator: (valor) {
                          if (valor == null || valor.trim().isEmpty) {
                            return 'Informe a meta';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: () {
                          if (_chave.currentState!.validate()) {
                            // read dentro do onPressed, para MANDAR mudar (não se inscreve).
                            context.read<HabitosStore>().adicionar(
                                  Habito(_nome.text.trim(), _meta.text.trim(), Icons.check_circle),
                                );
                            // O pop volta a só fechar a tela: não carrega mais dado.
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Salvar'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }
}