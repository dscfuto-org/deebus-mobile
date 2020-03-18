import 'dart:async';

import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Constants/AssetsStrings.dart';
import 'package:deebus/User/tests.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

//class DashBoard extends StatefulWidget {
//
//  @override
//  _DashBoardState createState() => _DashBoardState();
//}
//
//class _DashBoardState extends State<DashBoard> {
//  final Map<String, Marker> _markers = {};
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: GoogleMap(
//        mapType: MapType.hybrid,
//        initialCameraPosition: CameraPosition(
//          target: LatLng(40.688841, -74.044015),
//          zoom: 11,
//        ),
//        markers: _markers.values.toSet(),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _getLocation,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ),
//    );
//  }
//  void _getLocation() async {
//    var currentLocation = await Geolocator()
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
//
//    setState(() {
//      _markers.clear();
//      final marker = Marker(
//        markerId: MarkerId("curr_loc"),
//        position: LatLng(currentLocation.latitude, currentLocation.longitude),
//        infoWindow: InfoWindow(title: 'Your Location'),
//      );
//      _markers["Current Location"] = marker;
//    });
//  }
//}
//
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();
  // ignore: non_constant_identifier_names
  final double CAMERA_ZOOM = 16;
//  final double CAMERA_TILT = 80;
  // ignore: non_constant_identifier_names
  final double CAMERA_BEARING = 30;
  // ignore: non_constant_identifier_names
  final LatLng SOURCE_LOCATION = LatLng(42.747932, -71.167889);
  // ignore: non_constant_identifier_names
  LatLng DEST_LOCATION = LatLng(37.335685, -122.0605916);

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
// for my drawn routes on the map
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;
  String googleAPIKey = "AIzaSyAl94Ny5NNazeIpGGCG0DdCfDYR59GWKQ8";
// for my custom marker pins
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
// the user's initial location and current location
// as it moves
  LocationData currentLocation;
// a reference to the destination location
  LocationData destinationLocation;
// wrapper around the location API
  Location location = Location();
  @override
  void initState() {
    super.initState();

    // create an instance of Location
    location = new Location();
    polylinePoints = PolylinePoints();

    // subscribe to changes in the user's location
    // by "listening" to the location's onLocationChanged event
    location.onLocationChanged().listen((LocationData cLoc) {
      // cLoc contains the lat and long of the
      // current user's position in real time,
      // so we're holding on to it
      currentLocation = cLoc;
      updatePinOnMap(context);
      if (currentLocation.latitude == destinationLocation.latitude &&
          currentLocation.longitude == destinationLocation.longitude) {
        // rider reached location
        // alert rider

//        Navigator.push(context,
//            MaterialPageRoute(builder: (context) => LocationReached()));
      }
    });
    // set custom marker pins
    setSourceAndDestinationIcons();
    // set the initial location
    setInitialLocation();
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/driving_pin.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/destination_map_marker.png');
  }

  void setInitialLocation() async {
    // set the initial location by pulling the user's
    // current location from the location's getLocation()
    currentLocation = await location.getLocation();

    // hard-coded destination for this example
    destinationLocation = LocationData.fromMap({
      "latitude": DEST_LOCATION.latitude,
      "longitude": DEST_LOCATION.longitude
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.height;
    // SystemChrome.setEnabledSystemUIOverlays([]);
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values) ;

    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
//        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: SOURCE_LOCATION);
    if (currentLocation != null) {
      initialCameraPosition = CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: CAMERA_ZOOM,
//          tilt: CAMERA_TILT,
          bearing: CAMERA_BEARING);
    }

    return Scaffold(
      key: _scafoldKey,
      //The menu bar
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                              radius: deviceH * 4 / 100,
                              backgroundColor: AppColors.color4,
                              
                              child: Image.asset(thirdVector),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(

                              children: <Widget>[
                                Text(
                                  'Odii Marshall',
                                  style: textStyleBigRegular,
                                ),
                                Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.w100),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.color4
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Free Rides',
                      style: textStyleBigLight,
                    ),
                    leading: Icon(Icons.headset),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Payments',
                      style: textStyleBigLight,

                    ),
                    leading: Icon(Icons.credit_card),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text(
                      'History',
                      style: textStyleBigLight,
                    ),
                    leading: Icon(Icons.history),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Support',
                      style: textStyleBigLight,
                    ),
                    leading: Icon(Icons.chat),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text(
                      'About',
                      style: textStyleBigLight,
                    ),
                    leading: Icon(Icons.info),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  ),
                  minWidth: deviceW,
                  height: 50,
                  onPressed: this.test,
//                              async{
//                                if(controller.text.length!=6){
//                                  setState(() {
//                                    hasError = true;
//                                  });
//                                } else if(equalsIgnoreCase(widget.tranType, "Withdrawal")){
//                                  submitWithdrawal();
//                                }
//                              },
                  color: AppColors.color4,
                  child: Text(
                    "SIGN UP TO DRIVE",
                    style: TextStyle(
                        color: Colors.white, fontSize: 16.0),
                  ),
                ),
            )
          ],
        ),
      ),
      //The body of the app
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                // flex: 5,
                child: GoogleMap(
                    myLocationEnabled: true,
                    compassEnabled: false,
                    buildingsEnabled: false,
                    tiltGesturesEnabled: false,
                    markers: _markers,
                    polylines: _polylines,
                    mapType: MapType.normal,
                    initialCameraPosition: initialCameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      showPinsOnMap();
                    }),
              ),
            ],
          ),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () => _scafoldKey.currentState.isDrawerOpen == true
                      ? null
                      : _scafoldKey.currentState.openDrawer(),
                  child: CircleAvatar(
                    backgroundColor: AppColors.color4,
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
          ),
          SlidingUpPanel(
            maxHeight: deviceH,
            minHeight: deviceH*6/14,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0)
            ),
            panel: Container(
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: deviceH * 2 / 100,
                  ),
                  Text(
                    'Good evening Marshall',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Maven',
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: deviceH * 2 / 100,
                  ),
                  Divider(
                    thickness: 2.0,
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: deviceW * 2 / 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        TextField(
                          onSubmitted: (val) {
                            print(val);
                            if (val.contains(',')) {
                              destinationLocation = LocationData.fromMap({
                                "latitude":
                                double.tryParse(val.split(',').first),
                                "longitude":
                                double.tryParse(val.split(',').last)
                              });
                              setSourceAndDestinationIcons();
                              setInitialLocation();
                              setPolylines();
                              showPinsOnMap();
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'Where to?',
                              hintStyle: TextStyle(fontSize: 18.0),
                              fillColor: Colors.black12,
                              filled: true,
                              border: InputBorder.none),
                        ),
                        SizedBox(
                          height: deviceH * 1 / 100,
                        ),
                        FlatButton(
                          // onTap: () {},
                          onPressed: () {},
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: deviceH * 2 / 100,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: AppColors.color4,
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: deviceW * 3 / 100,
                                        ),
                                        Text(
                                          'Choose a saved place',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontFamily: 'Maven',
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.black45,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: deviceH * 2 / 100,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: unused_field
  static final CameraPosition _ccj = CameraPosition(
    target: LatLng(11.1446454, 75.9452897),
    zoom: 14.4746,
  );
  // ignore: unused_field
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void updatePinOnMap(BuildContext context) async {
    // create a new CameraPosition instance
    // every time the location changes, so the camera
    // follows the pin as it moves with an animation
    CameraPosition cPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
//      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
    // do this inside the setState() so Flutter gets notified
    // that a widget update is due
    setState(() {
      // updated position
      var pinPosition =
      LatLng(currentLocation.latitude, currentLocation.longitude);

      // the trick is to remove the marker (by id)
      // and add it again at the updated location
      _markers.removeWhere((m) => m.markerId.value == 'sourcePin');
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: pinPosition, // updated position
          icon: sourceIcon));
    });
  }

  void setPolylines() async {
    List<PointLatLng> result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPIKey,
        currentLocation.latitude,
        currentLocation.longitude,
        destinationLocation.latitude,
        destinationLocation.longitude);
    if (result.isNotEmpty) {
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {
        _polylines.add(Polyline(
            width: 5, // set the width of the polylines
            polylineId: PolylineId("poly"),
            color: Color.fromARGB(255, 40, 122, 198),
            points: polylineCoordinates));
      });
    }
  }

  void showPinsOnMap() {
    // get a LatLng for the source location
    // from the LocationData currentLocation object
    var pinPosition =
    LatLng(currentLocation.latitude, currentLocation.longitude);
    // get a LatLng out of the LocationData object
    var destPosition =
    LatLng(destinationLocation.latitude, destinationLocation.longitude);
    // add the initial source location pin
    _markers.add(Marker(
        markerId: MarkerId('sourcePin'),
        position: pinPosition,
        icon: sourceIcon));
    // destination pin
    _markers.add(Marker(
        markerId: MarkerId('destPin'),
        position: destPosition,
        icon: destinationIcon));
    // set the route lines on the map from source to destination

    setPolylines();
  }

  void test() {
    {navigatePush(context, Page());}
  }


}