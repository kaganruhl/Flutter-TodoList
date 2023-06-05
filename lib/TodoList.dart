import 'dart:math';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map> TodoList = [];
  var element;

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
                for (int i = 0; i < 5; i++) {
                  Map<String, dynamic> todo = {
                    "id": i + 1,
                    "title": "Başlık ${i + 1}",
                    "isComplated": i % 2 == 0 ? true : false,
                  };

                  TodoList.add(todo);
                }
              });
            },
            child: const Card(
              color: Colors.white,
              child: Text('TodoList Üret'),
            ),
          ),
          Flexible(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                height: 2,
              ),
              itemCount: TodoList.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(TodoList[index]['title'].toString()),
                    leading: Container(
                        width: 70,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Checkbox(
                                checkColor: Colors.white,
                                      value: TodoList[index]['isComplated'] == true ? true : false,
                                fillColor: MaterialStateColor.resolveWith((states) => TodoList[index]['isComplated'] == true ? Colors.green : Colors.red),
                                      onChanged: (bool? value) {
                                                setState(() {
                                           });
                                       }
                                  )
                          )
                        ],
                      ),
                    ),
                    trailing: Container(
                      width: 70,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      TodoList.removeAt(index);
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
