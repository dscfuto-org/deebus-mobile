import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Constants/AppColors.dart' as prefix0;
import 'package:deebus/Data/DummyData.dart';
import 'package:deebus/User/About.dart';
import 'package:deebus/User/FreeRides.dart';
import 'package:deebus/User/History.dart';
import 'package:deebus/User/Payments.dart';
import 'package:deebus/User/Profile.dart';
import 'package:deebus/User/Support.dart';
import 'package:deebus/Utils/AlertDialogs.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
//import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {

  TextEditingController controller = TextEditingController();
  int pinLength = 4;
  bool hasError = false;
  String otp;
  bool isLoadingPayment = false;

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
  //PolylinePoints polylinePoints;
  String googleAPIKey = "AIzaSyCbQB5ArOxQOvkDdgVwrT4oQJ_epy15lbk";
// for my custom marker pins
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
// the user's initial location and current location
// as it moves
  //AIzaSyCbQB5ArOxQOvkDdgVwrT4oQJ_epy15lbk
  LocationData currentLocation;
// a reference to the destination location
  LocationData destinationLocation;
// wrapper around the location API
  Location location = Location();

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  getCurrentLocation(){
    // create an instance of Location
    location = new Location();

    location.onLocationChanged().listen((LocationData cLoc) {
      // cLoc contains the lat and long of the
      // current user's position in real time,
      // so we're holding on to it
      currentLocation = cLoc;
      updatePinOnMap(context);
//      if (currentLocation.latitude == destinationLocation.latitude &&
//          currentLocation.longitude == destinationLocation.longitude) {
//        // rider reached location
//        // alert rider
//      }
    });

  }
  _launchURL() async {
    const url = 'https://codemarka.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    //polylinePoints = PolylinePoints();

    // subscribe to changes in the user's location
    // by "listening" to the location's onLocationChanged event
    // set custom marker pins
    setSourceAndDestinationIcons();
    // set the initial location
    setInitialLocation();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
    } else if (connectivityResult == ConnectivityResult.wifi) {
    } else showNetworkErrorDialog(context, " No Internet Connection");
  }
  void showNetworkErrorDialog(BuildContext context, String message, ) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Notification'),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                navigateBack(context);
  },
  )
          ],
        ));
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
        child:
        Container(
          height: 10,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                    height: 110.0,
                    child: DrawerHeader(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(width: 15.0,),
                                CircleAvatar(
                                  radius: deviceH * 4 / 100,
                                  backgroundColor: AppColors.color4,

                                  child: Icon(Icons.person, color:AppColors.color1,
                                  size: 50.0,),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      DummyData.firstName.toString() + " " + DummyData.lastName.toString(),
                                      // ResponseData.loginResponse.lastName.toString() == null ? DummyData.lastName : ResponseData.loginResponse.lastName.toString(),
                                      style: textStyleBigRegularB,
                                    ),
                                    SizedBox(height: 10.0,),
                                    Text(
                                     DummyData.email.toString(),
                                      style: TextStyle(
                                          color: Colors.black, fontWeight: FontWeight.w100),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.color1
                        ),
                        margin: EdgeInsets.all(0.0),
                        padding: EdgeInsets.all(0.0)
                    ),
                  ),
                    ListTile(
                      title: Text(
                        'My Profile',
                        style: textStyleBigLight,
                      ),
                      leading: Icon(Icons.perm_identity, color: Colors.black,),
                      onTap: () {
                        navigatePush(context, ProfileScreen());
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Free Rides',
                        style: textStyleBigLight,
                      ),
                      leading: Icon(Icons.card_giftcard, color: Colors.black,),
                      onTap: () {
                        navigatePush(context, FreeRides());
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Payments',
                        style: textStyleBigLight,

                      ),
                      leading: Icon(Icons.credit_card, color: Colors.black),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                        navigatePush(context, PaymentScreen());
                      },
                    ),
                    ListTile(
                      title: Text(
                        'History',
                        style: textStyleBigLightC,
                      ),
                      leading: Icon(Icons.history, color: AppColors.color5,),
                      onTap: () {
                        navigatePush(context, History());
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Support',
                        style: textStyleBigLight,
                      ),
                      leading: Icon(Icons.chat, color: AppColors.color5, ),
                      onTap: () {
                        navigatePush(context, SupportScreen());
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Text(
                        'About',
                        style: textStyleBigLight,
                      ),
                      leading: Icon(Icons.info_outline, color: AppColors.color5, ),
                      onTap: () {
                        navigatePush(context, AboutScreen());
                        // Update the state of the app.
                        // ...
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0, right: 10.0, left: 10),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  ),
                  minWidth: deviceW,
                  height: 50,
                  onPressed: _launchURL,
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
        )
      ),
      //The body of the ap
      body: Stack(
        children: <Widget>[
          Container(
            height: deviceH*9/14,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  // flex: 5,
                  child: GoogleMap(
                      myLocationEnabled: true,
                      compassEnabled: false,
                      myLocationButtonEnabled: false,
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
          ),
//          Positioned(
//            width: deviceW,
//            top: deviceH*7/14,
//            child: MaterialButton(
//              shape: CircleBorder(
//                //borderRadius: BorderRadius.all(Radius.circular(40.0)),
//              ),
//              onPressed: getCurrentLocation,
//              color: prefix0.AppColors.color4,
//              child: Padding(
//                padding: EdgeInsets.all(12.0),
//                child: Icon(Icons.location_searching, color: AppColors.color1,),
//              )
//            ),
//          ),
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
            maxHeight: deviceH-26,
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
                    'Enter Bus Code',
                    style: textStyleBigRegularGreet,
                  ),
                  SizedBox(
                    height: deviceH * 1 / 100,
                  ),
                  Divider(
                    thickness: 2.0,
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: deviceW * 2 / 100),
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child:
                          PinCodeTextField(
                            pinBoxHeight: 50,
                            pinBoxWidth: 50,
                            autofocus: false,
                            controller: controller,
                            hideCharacter: true,
                            highlight: true,
                            highlightColor: AppColors.color4,
                            pinBoxRadius: 10,
                            pinBoxColor: Colors.white,
                            defaultBorderColor: AppColors.color4,
                            hasTextBorderColor: Colors.green,
                            maxLength: pinLength,
                            hasError: hasError,
                            keyboardType: TextInputType.number,
                            maskCharacter: "*",

                            onTextChanged: (text) {
                              setState(() {
                                hasError = false;
                              });
                            },
                            onDone: (text){
                              otp=text;
                              if(text.length!=4){
                                setState(() {
                                  hasError = true;
                                });
                              }

                            },
//pinCodeTextFieldLayoutType: PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
                            wrapAlignment: WrapAlignment.center,
                            pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                            pinTextStyle: TextStyle(fontSize: 30.0),
                            pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
                            pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
                          ),
                        ),
                        Visibility(
                          child: Text(
                            "Wrong PIN!",
                            style: TextStyle(color: Colors.red),
                          ),
                          visible: hasError,
                        ),
                        Center(
                          child: isLoadingPayment
                              ?
                          CircularProgressIndicator(
                            backgroundColor: AppColors.color1,
                            valueColor: new AlwaysStoppedAnimation(prefix0.AppColors.color4),
                          )

                              :
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            ),
                            height: 50,
                            minWidth: deviceW,
                            onPressed: () => {
                              successAlert()
                            },
                            color: AppColors.color4,
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
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
//      floatingActionButton: FloatingActionButton(
//        child: SafeArea(
//            child: Icon(Icons.location_searching),
//        ),
//        onPressed: getCurrentLocation,
//      ),
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

//  void setPolylines() async {
//    List<PointLatLng> result = await polylinePoints.getRouteBetweenCoordinates(
//        googleAPIKey,
//        currentLocation.latitude,
//        currentLocation.longitude,
//        destinationLocation.latitude,
//        destinationLocation.longitude);
//    if (result.isNotEmpty) {
//      result.forEach((PointLatLng point) {
//        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//      });
//      setState(() {
//        _polylines.add(Polyline(
//            width: 5, // set the width of the polylines
//            polylineId: PolylineId("poly"),
//            color: Color.fromARGB(255, 40, 122, 198),
//            points: polylineCoordinates));
//      });
//    }
//  }

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

    //setPolylines();
  }

   successAlert() async {
    showAlertDialog(context, "Successful Payment");
  }

}
