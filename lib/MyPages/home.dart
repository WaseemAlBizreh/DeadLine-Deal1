import 'package:flutter/material.dart';


class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}


//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MyAppState();
//   }
// }
//
// class _MyAppState extends State<MyApp> {
//   int _counter = 0;
//   var str = "";
//
//   void _increamentCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         //home page main page يحمل الصفحة بالكامل
//         appBar: AppBar(
//           // الشريط في أعلى التطبيق
//           title: const Text("Waseem AlBizreh App"),
//           backgroundColor: Color.fromRGBO(4, 134, 4, 1.0),
//         ),
//         body: Container(
//           alignment: Alignment.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 str,
//               ),
//               SizedBox(height: 30),
//               Container(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children:[
//                       ElevatedButton(
//                         onPressed: () {
//                           str = "This is my button";
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: Color.fromRGBO(13, 120, 6, 1.0), // background
//                           onPrimary: Color.fromRGBO(255, 0, 0, 1.0), // foreground
//                         ),
//                         child: Container(
//                           width: 160,
//                           height: 40,
//                           padding: EdgeInsets.all(8.0),
//                           child: Row(
//                             children: const [
//                               Icon(
//                                 Icons.navigate_next,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(width: 8,),
//                               Text(
//                                 'My Button',
//                                 style: TextStyle(
//                                   color:Colors.white,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             str = "Hello in My App";
//                           });
//                         },
//                         onLongPress: (){
//                           setState(() {
//                             str = "";
//                           });
//                         },
//                         child:(
//                             Container(
//                               width: 100,
//                               child: const Text(
//                                 'Click',
//                                 textAlign: TextAlign.center,
//                               ),
//                             )
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           primary: Color.fromRGBO(13, 120, 6, 1.0),
//                           padding: EdgeInsets.all(15.0),
//                           textStyle: const TextStyle(
//                             fontSize:20,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                           ),
//                         ),
//                       ),
//                     ]),
//               ),
//               SizedBox(height: 30),
//               Text('Push The Button to increase the Counter'),
//               Text(
//                 '$_counter',
//                 style: const TextStyle(
//                   color: Color(0xFF5C5C5C),
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _increamentCounter,
//           child: const Icon(Icons.add),
//           backgroundColor: Color.fromRGBO(4, 134, 4, 1.0),
//         ),
//       ),
//     );
//   }
// }
// //void main() => runApp(MaterialApp(home: Home()));
//
// class Controller extends GetxController {
//   var count = 0.obs;
//   increment() => count++;
// }
//
// class Home extends StatelessWidget {
//   @override
//   Widget build(context) {
//     // Instantiate your class using Get.put() to make it available dependency for all "child" routes there.
//     final Controller c = Get.put(Controller());
//     return Scaffold(
//       // Use Obx(()=> to update Text() whenever count is changed.
//         appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
//         // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
//         body: Center(
//             child: ElevatedButton(
//                 child:Text("Go to Other"),
//                 onPressed: () => Get.to(Other()))),
//         floatingActionButton: FloatingActionButton(
//             child: Icon(Icons.add), onPressed: c.increment));
//
//   }
// }
//
// class Other extends StatelessWidget {
//   // You can ask Get to find a Controller that is being used by another page and redirect you to it.
//   final Controller c = Get.find();
//
//   @override
//   Widget build(context) {
//     // Access the updated count variable
//     return Scaffold(body: Center(child: Text("${c.count}")));
//   }
// }
