// // ignore_for_file: camel_case_types

// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:fluttertemplate/Helpers/constants.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class orderTrackingMaps extends StatefulWidget {
//   const orderTrackingMaps({super.key});

//   @override
//   State<orderTrackingMaps> createState() => _orderTrackingMapsState();
// }

// class _orderTrackingMapsState extends State<orderTrackingMaps> {
//   final fromlocation = const LatLng(37.33500926, -122.03272188);
//   final tolocation = const LatLng(37.33429383, -122.06600055);

//   List<LatLng> polylineCordinates = [];

//   void getPolyPoints() async {
//     String googleApiKey = Constants.GOOGLEAPI;
//     PolylinePoints polylinepoints = PolylinePoints();

//     PolylineResult result = await polylinepoints.getRouteBetweenCoordinates(
//         googleApiKey,
//         PointLatLng(fromlocation.latitude, fromlocation.longitude),
//         PointLatLng(tolocation.latitude, tolocation.longitude));

//     if (result.points.isNotEmpty) {
//       result.points.forEach((point) {
//         polylineCordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     } else {
//       print("Somethign went wrong, no route found");
//     }

//     setState(() {});
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     setCustomMarkers();
//     getPolyPoints();
//     super.initState();
//   }

//   //Icons
//   BitmapDescriptor SourceIcon = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor DestinationIcon = BitmapDescriptor.defaultMarker;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Google Maps"),
//       ),
//       body: SafeArea(
//         child: GoogleMap(
//           initialCameraPosition: CameraPosition(target: fromlocation, zoom: 12),
//           markers: {
//             Marker(
//                 markerId: const MarkerId("From"),
//                 icon: SourceIcon,
//                 infoWindow: const InfoWindow(
//                   title: "From Location",
//                   snippet: "Source Location",
//                 ),
//                 position: fromlocation),
//             Marker(
//                 markerId: const MarkerId("To"),
//                 infoWindow: const InfoWindow(
//                   title: "To Location",
//                   snippet: "Destination Location",
//                 ),
//                 position: tolocation,
//                 icon: DestinationIcon)
//           },
//           polylines: {
//             Polyline(
//                 width: 6,
//                 polylineId: PolylineId("route"),
//                 points: polylineCordinates,
//                 color: Colors.blue),
//           },
//         ),
//       ),
//     );
//   }

//   Future<void> setCustomMarkers() async {
//     BitmapDescriptor.fromAssetImage(
//             const ImageConfiguration(
//               size: Size(5, 5),
//             ),
//             "assets/png_logo/logo.png")
//         .then((value) => DestinationIcon = value);
//     BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(5, 5)),
//             "assets/png_logo/map_marker.png")
//         .then((value) => SourceIcon = value);

//     // setState(() {});
//   }
// }
