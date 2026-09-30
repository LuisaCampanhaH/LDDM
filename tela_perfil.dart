import 'package:flutter/material.dart';

// Conteúdo provisório: os slides pedem "as telas de cada seção, ainda que com
// conteúdo provisório". Troque pelo conteúdo do seu produto.
class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 28, child: Icon(Icons.person)),
            SizedBox(height: 12),
            Text('Perfil do usuário'),
          ],
        ),
      ),
    );
  }
}