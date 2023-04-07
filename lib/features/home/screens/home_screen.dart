import 'package:flutter/material.dart';
import '../widgets/build_Card.dart';
import '../widgets/food_searchbar.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.all(15)),
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
              child: FoodSearchBar(),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
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
                  buildCard(),
                  buildCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

































// // import 'dart:js_interop';

// import 'package:flutter/material.dart';
// import 'package:project_s4/providers/user_provider.dart';
// import 'package:provider/provider.dart';

// class HomeSceen extends StatefulWidget {
//   static const routeName = '/home-screen';
//   const HomeSceen({super.key});

//   @override
//   State<HomeSceen> createState() => _HomeSceenState();
// }

// class _HomeSceenState extends State<HomeSceen> {
//   @override
//   //getter for user data
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserProvider>(context).user;
//     return Scaffold(
//       body: Center(
//         child: Text(
//           user.toJson(),
//         ),
//       ),
//     );
//   }
// }