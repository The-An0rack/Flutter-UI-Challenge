import 'package:coffee/util/coffee_type.dart';

import '../util/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentSelection = 0;
  final List coffeeType = [
    ['Cappucino', true],
    ['Lattee', false],
    ['Black', false],
    ['Tea', false]
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      coffeeType[currentSelection][1] = false;
      currentSelection = index;
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.person,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'notifications',
          ),
        ],
      ),
      body: Column(
        children: [
          //text: find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue(fontSize: 56),
            ),
          ),
          //Search Bar
          const SizedBox(
            height: 25,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Find your perfect coffee...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),

          //Horizontal list of coffee titles
          const SizedBox(
            height: 25,
          ),

          //Coffee List
          Container(
            height: 50,
            child: ListView.builder(
                itemCount: coffeeType.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) => CoffeeType(
                    coffeeType: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: () {
                      coffeeTypeSelected(index);
                    }))),
          ),

          //Coffee Tiles
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CoffeeTile(),
                CoffeeTile(),
                CoffeeTile(),
                CoffeeTile(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
