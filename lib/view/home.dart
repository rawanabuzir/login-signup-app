import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.cyan[800],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[800],
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView(children: [
        InkWell(
          onTap: () {},
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  // child: Image.network(
                  //   'https://i.pinimg.com/564x/34/fc/b7/34fcb738f7264980e685ed4cc2adc84e.jpg',
                  //   width: 100,
                  //   height: 100,
                  //   fit: BoxFit.fill,
                  // ),)
            child:  const Image(image: AssetImage('img/img2.jpg'),
                width: 100,
                  height: 100,
                  fit: BoxFit.fill

            ),),
                )
    ,
                const Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text("Title Note"),
                      subtitle: Text("Content Note"),
                      // trailing: ,
                    ))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
