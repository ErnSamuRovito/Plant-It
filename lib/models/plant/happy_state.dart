import 'package:planit/models/plant/normal_state.dart';
import 'package:planit/models/plant/plant_context.dart';
import 'package:planit/models/plant/plant_state.dart';
import 'package:planit/utils/global_resources.dart';

class HappyState extends PlantState {
  @override
  String getImage() => GlobalResources.happyPlantGif;

  @override
  void changeHp(PlantContext context, int amount) {
    context.hp += amount;
    if (context.hp <= 80) {
      context.setState(NormalState());
    }
  }
}
