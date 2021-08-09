import 'package:flutter/material.dart';

import 'common.dart';
import 'goals.dart';

const Color notionBg = const Color(0xff2F3437);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      // theme: appTheme,
      darkTheme: darkTheme,
      home: Goals(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late Future<List<Goal>> futureGoals;

//   @override
//   void initState() {
//     super.initState();
//     futureGoals = Service.fetchGoals();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Text"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             GoalTracker(),
//             SizedBox(height: 128),
//             Center(
//               child: FutureBuilder<List<Goal>>(
//                 future: futureGoals,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return Text(snapshot.data![0].name,
//                         style: TextStyle(color: Colors.green, fontSize: 20));
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   }

//                   // By default, show a loading spinner.
//                   return const CircularProgressIndicator();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
