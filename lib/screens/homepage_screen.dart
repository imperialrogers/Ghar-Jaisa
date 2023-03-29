import 'package:flutter/material.dart';
//import 'package:badges/badges.dart' as badges;

class HomePage extends StatelessWidget {
  @override
  Widget buildCard(int index) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 150,
        width: 150,
        color: Colors.orange,
        child: Center(
          child: Text('$index'),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(15)),
              Expanded(
                child: Text('Find Your Favourite Food',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left),
              ),
              Card(
                margin: EdgeInsets.all(25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      color: Colors.orange,
                      size: 30,
                    )),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 251, 240, 228),
                      hintText: 'What do you want to order?',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 215, 162, 93)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Color.fromARGB(255, 155, 93, 0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 251, 240, 228),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: IconButton(
                    color: Color.fromARGB(255, 198, 123, 12),
                    alignment: Alignment.center,
                    icon: Icon(
                      Icons.format_list_bulleted_sharp,
                      size: 26,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 140,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nearest Restaurant',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'View More',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 210,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(12),
                        itemCount: 10,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                        itemBuilder: (context, index) => buildCard(index),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
