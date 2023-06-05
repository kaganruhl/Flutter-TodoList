import 'dart:math';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> liste = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextButton(
            onPressed: () {
              Random rnd = Random();
              setState(() {
                liste = List.generate(10, (index) => rnd.nextInt(100));
              });
            },
            child: const Card(
              color: Colors.white,
              child: Text('Liste Üret'),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: liste.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(liste[index].toString()),
                    trailing: Container(
                      width: 70,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      liste.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(Icons.delete)))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
