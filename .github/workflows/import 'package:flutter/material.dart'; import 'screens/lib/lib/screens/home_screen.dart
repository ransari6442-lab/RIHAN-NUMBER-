import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget ball(String text, double size) {
    return ScaleTransition(
      scale: Tween(begin: 0.9, end: 1.05).animate(controller),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.red, width: 6),
          boxShadow: const [
            BoxShadow(
              color: Colors.purpleAccent,
              blurRadius: 20,
              spreadRadius: 4,
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 34,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 360,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.purpleAccent,
              width: 3,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.purpleAccent,
                blurRadius: 30,
                spreadRadius: 5,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const Text(
                "ANUSHKA SUREBET PANEL",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [

                  Row(
                    children: [
                      Icon(Icons.circle,
                          color: Colors.red, size: 12),
                      SizedBox(width: 5),
                      Text("LIVE"),
                    ],
                  ),

                  Text("MOD : ON"),

                  Text("PING : 31MS"),
                ],
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  ball("2", 80),
                  ball("2", 110),
                  ball("2", 80),
                ],
              ),

              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.purpleAccent),
                  borderRadius:
                      BorderRadius.circular(30),
                ),
                child: const Text(
                  "SEQ NO : 10994",
                  style: TextStyle(fontSize: 20),
                ),
              ),

              const SizedBox(height: 25),

              Row(
                children: [

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.purpleAccent,
                        padding:
                            const EdgeInsets.all(18),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "EXECUTE",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.grey.shade900,
                        padding:
                            const EdgeInsets.all(18),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "HIDE",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
