import 'package:flutter/foundation.dart';
import 'habito.dart';

// A lista saiu de dentro das telas e passou a viver aqui, acima de todas.
// Repare: este arquivo NÃO importa material.dart. ChangeNotifier não é de interface:
// ele só guarda uma lista de interessados e avisa todos eles.
class HabitosStore extends ChangeNotifier {
  // Privada: só esta classe altera a lista. Começa vazia; os hábitos entram pelo formulário.
  final List<Habito> _habitos = [];

  // Devolve uma cópia que recusa alterações: quem tentar add direto recebe erro.
  List<Habito> get habitos => List.unmodifiable(_habitos);

  void adicionar(Habito h) {
    _habitos.add(h);
    notifyListeners(); // quem estiver ouvindo, redesenhe
  }

  void removerEm(int i) {
    _habitos.removeAt(i); // por posição, não por valor
    notifyListeners();
  }
}