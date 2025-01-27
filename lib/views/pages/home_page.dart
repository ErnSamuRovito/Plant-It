import 'package:flutter/material.dart';
import 'package:planit/models/plant/plant_context.dart';

/// Pagina Home con gestione dello stato della pianta
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PlantContext plantContext = PlantContext();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mostra l'immagine basata sullo stato
            Image.asset(
              plantContext.getImage(),
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),

            // Mostra gli HP
            Text(
              "Plant HP: ${plantContext.hp}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),

            // Pulsante per ridurre gli HP
            ElevatedButton(
              onPressed: () {
                setState(() {
                  plantContext.changeHp(-20); // Riduci gli HP
                });
              },
              child: const Text("Decrease HP"),
            ),

            // Pulsante per aumentare gli HP
            ElevatedButton(
              onPressed: () {
                setState(() {
                  plantContext.changeHp(20); // Aumenta gli HP
                });
              },
              child: const Text("Increase HP"),
            ),
          ],
        ),
      ),
    );
  }
}
