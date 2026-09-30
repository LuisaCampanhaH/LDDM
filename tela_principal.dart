import 'package:flutter/material.dart';
import 'tela_habitos.dart';
import 'tela_perfil.dart';
import 'tela_resumo.dart';

// Trocar de seção não é navegar: não há Navigator aqui, só um índice no State.
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _aba = 0; // qual seção está aberta

  // Três telas na lista, três destinos na barra. Os dois têm que ter o mesmo tamanho.
  final _telas = const [
    TelaHabitos(),
    TelaResumo(),
    TelaPerfil(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _telas[_aba], // o corpo troca
        bottomNavigationBar: _barra(), // a barra fica (é propriedade do Scaffold)
      );

  Widget _barra() => NavigationBar(
        selectedIndex: _aba,
        onDestinationSelected: (i) => setState(() => _aba = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: 'Hábitos'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Resumo'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      );
}