import 'package:flutter/material.dart';

void main() {
  runApp(const SmartHomeApp());
}

class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SmartHomeScreen(),
    );
  }
}

class SmartHomeScreen extends StatefulWidget {
  const SmartHomeScreen({super.key});

  @override
  _SmartHomeScreenState createState() => _SmartHomeScreenState();
}

class _SmartHomeScreenState extends State<SmartHomeScreen> {
  bool isLightOn = true;
  bool isAcOn = true;
  bool isTvOn = false;
  bool isFanOn = false;

  Widget buildDeviceTile(
    String name,
    IconData icon,
    bool state,
    Function(bool) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            state ? const Color.fromARGB(255, 139, 96, 117) : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: state ? Colors.white : Colors.black54),
          const SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              color: state ? Colors.white : Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Transform.rotate(
            angle: -90 * 3.1415926535 / 180, // 90 градусқа бұру
            child: Switch(
              value: state,
              onChanged: onChanged,
              activeColor: const Color.fromARGB(255, 244, 223, 177),
              inactiveTrackColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "My Smart Home",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color.fromARGB(255, 139, 96, 117),
        centerTitle: true,
        leading: const Icon(Icons.grid_view),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Smart Devices",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  buildDeviceTile(
                    "Smart Light",
                    Icons.lightbulb,
                    isLightOn,
                    (val) => setState(() => isLightOn = val),
                  ),
                  buildDeviceTile(
                    "Smart AC",
                    Icons.ac_unit,
                    isAcOn,
                    (val) => setState(() => isAcOn = val),
                  ),
                  buildDeviceTile(
                    "Smart TV",
                    Icons.tv,
                    isTvOn,
                    (val) => setState(() => isTvOn = val),
                  ),
                  buildDeviceTile(
                    "Smart Fan",
                    Icons.toys,
                    isFanOn,
                    (val) => setState(() => isFanOn = val),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
