import 'package:flutter/material.dart';

// Dados do hábito, usados pela lista e pela tela de detalhe.
class Habito {
  final String nome;
  final String meta;
  final IconData icone;

  const Habito(this.nome, this.meta, this.icone);
}