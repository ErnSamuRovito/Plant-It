import 'package:planit/models/plant/plant_context.dart';

// Classe astratta per definire lo stato della pianta
abstract class PlantState {
  String getImage();
  void changeHp(PlantContext context, int amount);
}
