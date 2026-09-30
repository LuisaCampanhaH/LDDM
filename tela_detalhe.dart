import 'package:flutter/material.dart';
import 'habito.dart';

class TelaDetalhe extends StatelessWidget {
  // O hábito chega pelo construtor e não muda: por isso a tela é Stateless.
  const TelaDetalhe({super.key, required this.habito});

  final Habito habito;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Item 1: barra com o nome do hábito. A seta de voltar aparece sozinha,
      // porque esta tela é empilhada com Navigator.push (não programe a seta).
      appBar: AppBar(title: Text(habito.nome)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _cabecalho(context),
            const SizedBox(height: 16),
            // Item 4: três indicadores, cada um em Expanded = partes iguais da largura.
            const Row(
              children: [
                Expanded(child: _Indicador(valor: '7', rotulo: 'dias seguidos')),
                Expanded(child: _Indicador(valor: '85%', rotulo: 'no mês')),
                Expanded(child: _Indicador(valor: '21', rotulo: 'no total')),
              ],
            ),
            const SizedBox(height: 16),
            // Item 5: bloco de texto com título e descrição.
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      'Sobre este hábito',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  // Margem lateral: SizedBox + Expanded dentro de uma Row.
                  const Row(
                    children: [
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Aqui vai a descrição do hábito: por que ele importa, '
                          'como você pretende acompanhá-lo e o que espera alcançar '
                          'com a prática diária, escrito em algumas linhas.',
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Itens 2 e 3: imagem por endereço + ícone circular sobreposto (Stack + Positioned).
  Widget _cabecalho(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Stack(
      clipBehavior: Clip.none,
      // A ordem dos filhos é a ordem das camadas: o último fica por cima.
      children: [
        // Camada 1: a imagem, com altura fixa e BoxFit.cover (não estica).
        Image.network(
          'https://picsum.photos/seed/agua/800/400',
          height: 160,
          width: double.infinity,
          fit: BoxFit.cover,
          // Sem rede: um bloco de cor no lugar, e a estrutura continua inteira.
          errorBuilder: (context, erro, pilha) => Container(
            height: 160,
            color: cores.primaryContainer,
          ),
          // Enquanto baixa, o espaço não fica vazio.
          loadingBuilder: (context, filho, progresso) => progresso == null
              ? filho
              : const SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Center(child: CircularProgressIndicator()),
                ),
        ),
        // Camada 2: nome e meta SOBRE a imagem, em faixa sólida. O par
        // primary / onPrimary garante o contraste, seja qual for a foto.
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            color: cores.primary,
            child: ListTile(
              title: Text(habito.nome, style: TextStyle(color: cores.onPrimary)),
              subtitle: Text(habito.meta, style: TextStyle(color: cores.onPrimary)),
            ),
          ),
        ),
        // Camada 3: o ícone circular, à esquerda, com fundo claro.
        Positioned(
          left: 16,
          top: 16,
          child: CircleAvatar(
            radius: 28,
            backgroundColor: cores.primaryContainer,
            child: Icon(habito.icone, color: cores.primary),
          ),
        ),
      ],
    );
  }
}

// Um indicador: valor em destaque e rótulo abaixo.
class _Indicador extends StatelessWidget {
  const _Indicador({required this.valor, required this.rotulo});

  final String valor;
  final String rotulo;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(valor, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(rotulo),
        ],
      );
}

