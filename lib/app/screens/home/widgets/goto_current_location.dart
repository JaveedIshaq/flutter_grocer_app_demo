// import 'package:flutter_grocer_app/core/models/user_detail_model.dart';
// import 'package:flutter_grocer_app/core/providers/map_provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';

// class GoToCurrentLocation extends StatefulWidget {
//   @override
//   _GoToCurrentLocationState createState() => _GoToCurrentLocationState();
// }

// class _GoToCurrentLocationState extends State<GoToCurrentLocation> {
//   static Firestore _db = Firestore.instance;
//   LatLng driverLocation;

//   void getDriverData() async {
//     var data = await _db
//         .collection('drivers')
//         .document("licVWH0RZcSaA51I01ZPLxJXQjS2")
//         .get()
//         .then((doc) => UserDetail.fromSnapshot(doc));

//     setState(() {
//       driverLocation = data.userCurrentLocation;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getDriverData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final MapProvider mapProvider =
//         Provider.of<MapProvider>(context, listen: false);
//     return InkWell(
//       onTap: () {
//         mapProvider.moveCameraToDriverLocation(driverLocation);
//       },
//       child: Container(
//         margin: EdgeInsets.only(right: 10, top: 15),
//         child: CircleAvatar(
//           radius: 20,
//           backgroundColor: Colors.grey.shade300,
//           child: Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: Icon(
//               Icons.my_location,
//               color: Colors.grey.shade800,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
