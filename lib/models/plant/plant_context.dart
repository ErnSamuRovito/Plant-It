// Classe principale che implementa il pattern State

import 'package:planit/models/plant/normal_state.dart';
import 'package:planit/models/plant/plant_state.dart';

class PlantContext {
  int hp = 50; // HP iniziali
  late PlantState _state;

  PlantContext() {
    _state = NormalState(); // Stato iniziale
  }

  // Getter per lo stato corrente
  PlantState get state => _state;

  // Metodo per cambiare stato
  void setState(PlantState newState) {
    _state = newState;
  }

  // Metodo per cambiare HP tramite lo stato
  void changeHp(int amount) {
    _state.changeHp(this, amount);
    hp = hp.clamp(0, 100); // Limita gli HP tra 0 e 100
  }

  // Metodo per ottenere l'immagine dallo stato corrente
  String getImage() {
    return _state.getImage();
  }
}
