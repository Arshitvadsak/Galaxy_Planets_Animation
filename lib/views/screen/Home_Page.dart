import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../Globlas/Palnets_List.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 3;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galaxy Planets"),
        centerTitle: true,
        backgroundColor: Color(0xFF6D9886),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: Column1.map(
                (e) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'Menu',
                      arguments: e,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: e['tag'],
                          child: Image(
                            image: AssetImage("${e['image']}"),
                            fit: BoxFit.cover,
                            height: 150,
                          ),
                        ),
                        const Text(
                          "------------------------------------",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          e['name'],
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700),
                        ),
                        const Text(
                          "------------------------------------",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
