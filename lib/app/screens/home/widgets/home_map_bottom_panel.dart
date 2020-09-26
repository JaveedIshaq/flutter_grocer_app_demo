// import 'package:flutter_grocer_app/app/screens/home/widgets/accepted_panel.dart';
// import 'package:flutter_grocer_app/app/screens/home/widgets/requested_waiting_dialog.dart';
// import 'package:flutter_grocer_app/app/screens/home/widgets/waiting_dialog.dart';
// import 'package:flutter_grocer_app/core/config/config.dart';
// import 'package:flutter_grocer_app/core/config/constants.dart';
// import 'package:flutter_grocer_app/core/models/delivery_model.dart';
// import 'package:flutter_grocer_app/core/models/models.dart';
// import 'package:flutter_grocer_app/core/services/firebase_auth_service.dart';
// import 'package:flutter_grocer_app/core/services/firestore_service.dart';
// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
// import 'package:provider/provider.dart';

// class HomeMapBottomPanel extends StatefulWidget {
//   @override
//   _HomeMapBottomPanelState createState() => _HomeMapBottomPanelState();
// }

// class _HomeMapBottomPanelState extends State<HomeMapBottomPanel> {
//   Logger log = getLogger("DeliveryRequestList");

//   @override
//   Widget build(BuildContext context) {
//     return PanelParentWidget();
//   }
// }

// // -------------------------------------------------------------------
// // ------------------------PanelParentWidget--------------------------
// // -------------------------------------------------------------------
// class PanelParentWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       child: ListView(
//         shrinkWrap: true,
//         children: <Widget>[
//           WaitingStreamNavigator(),
//           AcceptedPanelView(),
//           WaitingDialog(),
//         ],
//       ),
//     );
//   }
// }

// // -------------------------------------------------------------------
// // ------------------------AcceptedPanelView--------------------------
// // -------------------------------------------------------------------

// class AcceptedPanelView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final fireStoreService = Provider.of<FirestoreService>(context);
//     return StreamBuilder<List<Delivery>>(
//       stream: fireStoreService.getAllDeliveryRequests(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           if (snapshot.data.length == 0) {
//             return Text("");
//           }

//           if (snapshot.hasError) {
//             return Padding(
//               padding: const EdgeInsets.only(top: 40),
//               child: Center(
//                 child: Text(
//                   'Something has gone wrong!',
//                 ),
//               ),
//             );
//           }

//           Delivery acceptedDelivery = snapshot.data.firstWhere(
//               (element) => element.status == DeliveryStatus.accepted,
//               orElse: () => null);

//           Delivery inProcessDelivery = snapshot.data.firstWhere(
//               (element) => element.status == DeliveryStatus.inProcess,
//               orElse: () => null);

//           if (acceptedDelivery != null) {
//             return AcceptedPanel(delivery: acceptedDelivery);
//           } else if (inProcessDelivery != null) {
//             return AcceptedPanel(delivery: inProcessDelivery);
//           }
//         }

//         return Container();
//       },
//     );
//   }
// }
// // -------------------------------------------------------------------
// // ------------------------WaitingStreamNavigator--------------------------
// // -------------------------------------------------------------------

// class WaitingStreamNavigator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final fireStoreService = Provider.of<FirestoreService>(context);

//     return StreamBuilder<List<Delivery>>(
//       stream: fireStoreService.getAllDeliveryRequests(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           if (snapshot.data.length == 0) {
//             return Text("");
//           }

//           if (snapshot.hasError) {
//             return Padding(
//               padding: const EdgeInsets.only(top: 40),
//               child: Center(
//                 child: Text(
//                   'Something has gone wrong!',
//                 ),
//               ),
//             );
//           }

//           Delivery requestedDelivery = snapshot.data.firstWhere(
//               (element) => element.status == DeliveryStatus.requested,
//               orElse: () => null);

//           if (requestedDelivery != null) {
//             WidgetsBinding.instance.addPostFrameCallback((_) async {
//               Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => RequestedWaitingDialog(
//                             delivery: requestedDelivery,
//                           )));
//             });
//             return Container();
//           }
//         }

//         return Container();
//       },
//     );
//   }
// }
