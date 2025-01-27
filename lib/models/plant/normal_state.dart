// Stato "Normal"
import 'package:planit/models/plant/happy_state.dart';
import 'package:planit/models/plant/plant_context.dart';
import 'package:planit/models/plant/plant_state.dart';
import 'package:planit/models/plant/sad_state.dart';
import 'package:planit/utils/global_resources.dart';

class NormalState extends PlantState {
  @override
  String getImage() => GlobalResources.normalPlantGif;

  @override
  void changeHp(PlantContext context, int amount) {
    context.hp += amount;
    if (context.hp < 50) {
      context.setState(SadState());
    } else if (context.hp > 80) {
      context.setState(HappyState());
    }
  }
}
