import 'package:flutter/material.dart';
import 'dart:math';

import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static const historyLength = 5;

// The "raw" history that we don't access from the UI, filled with values
  List<String> foodList = [
    'Orange',
    'Berries',
    'Lemons',
    'Apples',
    'Mangoes',
    'Dates',
    'Avocados',
    'Black Beans',
    'Chickpeas',
    'Pinto beans',
    'White Beans',
    'Green lentils',
    'Split Peas',
    'Rice',
    'Oats',
    'Quinoa',
    'Pasta',
    'Sparkling water',
    'Coconut water',
    'Herbal tea',
    'Kombucha',
    'Almonds',
    'Peannuts',
    'Chia seeds',
    'Flax seeds',
    'Canned tomatoes',
    'Olive oil',
    'Broccoli',
    'Onions',
    'Garlic',
    'Carots',
    'Leafy greens',
    'Meat',
  ];
  List<String>? foodListSearch;
  final FocusNode _textFocusNode = FocusNode();
  final TextEditingController? _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            title: Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _textEditingController,
                focusNode: _textFocusNode,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    hintText: 'Search here',
                    contentPadding: EdgeInsets.only(left: 10, top: 10)
                ),
                onChanged: (value) {
                  setState(() {
                    foodListSearch = foodList
                        .where(
                            (element) => element.contains(value.toLowerCase()))
                        .toList();
                    if (_textEditingController!.text.isNotEmpty &&
                        foodListSearch!.length == 0) {
                      print('foodListSearch length ${foodListSearch!.length}');
                    }
                  });
                },
              ),
            )),
        body: _textEditingController!.text.isNotEmpty &&
            foodListSearch!.length == 0
            ? Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search_off,
                    size: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    'Try again',
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        )
            : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: 12,
            ),
            itemCount: _textEditingController!.text.isNotEmpty
                ? foodListSearch!.length
                : foodList.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // const CircleAvatar(
                    //   child: Icon(Icons.food_bank),
                    // ),
                    const SizedBox(
                      width: 10,
                    ),
                    Card(
                      color: Colors.grey,
                      child: Text(_textEditingController!.text.isNotEmpty
                          ? foodListSearch![index]
                          : foodList[index]),
                    ),
                  ],
                ),
              );
            }));
  }
}


// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   List<String> foodList = [
//     'Orange',
//     'Berries',
//     'Lemons',
//     'Apples',
//     'Mangoes',
//     'Dates',
//     'Avocados',
//     'Black Beans',
//     'Chickpeas',
//     'Pinto beans',
//     'White Beans',
//     'Green lentils',
//     'Split Peas',
//     'Rice',
//     'Oats',
//     'Quinoa',
//     'Pasta',
//     'Sparkling water',
//     'Coconut water',
//     'Herbal tea',
//     'Kombucha',
//     'Almonds',
//     'Peannuts',
//     'Chia seeds',
//     'Flax seeds',
//     'Canned tomatoes',
//     'Olive oil',
//     'Broccoli',
//     'Onions',
//     'Garlic',
//     'Carots',
//     'Leafy greens',
//     'Meat',
//   ];
//   List<String>? foodListSearch;
//   final FocusNode _textFocusNode = FocusNode();
//   TextEditingController? _textEditingController = TextEditingController();
//   @override
//   void dispose() {
//     _textFocusNode.dispose();
//     _textEditingController!.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             backgroundColor: Colors.blue.shade300,
//             title: Container(
//               decoration: BoxDecoration(
//                   color: Colors.blue.shade200,
//                   borderRadius: BorderRadius.circular(20)),
//               child: TextField(
//                 controller: _textEditingController,
//                 focusNode: _textFocusNode,
//                 cursorColor: Colors.black,
//                 decoration: InputDecoration(
//                     border: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     errorBorder: InputBorder.none,
//                     disabledBorder: InputBorder.none,
//                     hintText: 'Search here',
//                     contentPadding: EdgeInsets.all(8)),
//                 onChanged: (value) {
//                   setState(() {
//                     foodListSearch = foodList
//                         .where(
//                             (element) => element.contains(value.toLowerCase()))
//                         .toList();
//                     if (_textEditingController!.text.isNotEmpty &&
//                         foodListSearch!.length == 0) {
//                       print('foodListSearch length ${foodListSearch!.length}');
//                     }
//                   });
//                 },
//               ),
//             )),
//         body: _textEditingController!.text.isNotEmpty &&
//             foodListSearch!.length == 0
//             ? Center(
//           child: Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Icon(
//                     Icons.search_off,
//                     size: 160,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'No results found,\nPlease try different keyword',
//                     style: TextStyle(
//                         fontSize: 30, fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//             : ListView.builder(
//             itemCount: _textEditingController!.text.isNotEmpty
//                 ? foodListSearch!.length
//                 : foodList.length,
//             itemBuilder: (ctx, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       child: Icon(Icons.food_bank),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(_textEditingController!.text.isNotEmpty
//                         ? foodListSearch![index]
//                         : foodList[index]),
//                   ],
//                 ),
//               );
//             }));
//   }
// }