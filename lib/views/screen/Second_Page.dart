import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const  Duration(seconds: 7),
    );

    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> ABC =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    timeDilation = 3;
    return Scaffold(
      appBar: AppBar(
        title: Text(ABC['name']),
        centerTitle: true,
        backgroundColor: Color(ABC['color']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 500,
          width: 350,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Hero(
                  tag: ABC['tag'],
                  child: AnimatedBuilder(
                    animation: animationController,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
                      child: Container(
                        child: Image.asset(
                          ABC['image'],
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    builder: (BuildContext context, _widget) {
                      return Transform.rotate(
                        angle: animationController.value * 20,
                        child: _widget,
                      );
                    },
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70),
                  Row(
                    children: [
                      const Text(
                        "   Planet Name :-",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ABC['name'],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: const [
                      Text(
                        "   Details :-",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      ABC['desc'],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
