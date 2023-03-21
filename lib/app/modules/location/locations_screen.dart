import 'dart:async';

import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/components/button/button.dart';
import 'package:brain_heart/components/button/save_button.dart';
import 'package:brain_heart/components/common_header.dart';
import 'package:brain_heart/components/common_textfield.dart';
import 'package:brain_heart/helper/utils/constants.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Completer<GoogleMapController> controller = Completer();
  final CameraPosition kGoogle = const CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );
  final List<Marker> markers = <Marker>[];
  late BitmapDescriptor customIcon;

  @override
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size:  Size(50, 55)),
            ImageConstants.locationPin)
        .then((d) {
      customIcon = d;
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _determinePosition();
    });
  }

  void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();
    markers.add(Marker(
      markerId: const MarkerId("2"),
      position: LatLng(position.latitude, position.longitude),
      icon: customIcon,
      infoWindow: const InfoWindow(
        title: 'Dyker Beach Golf Course',
      ),
    ));

    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14,
    );
    final GoogleMapController controller2 = await controller.future;
    controller2.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            _mapWidget(),
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonHeader(
                    title: "Location",
                    isShowBackIcon: true,
                    isShowGps: true,
                  ),
                  _locationField(),
                ],
              ),
            ),
            _button(),
          ],
        ),
      ),
    );
  }

  Positioned _mapWidget() {
    return Positioned.fill(
      child: GoogleMap(
        zoomControlsEnabled: false,
        markers: Set<Marker>.of(markers),
        initialCameraPosition: kGoogle,
        // initialCameraP   osition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller1) {
          controller.complete(controller1);
        },
      ),
    );
  }

  Align _locationField() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.all(20),
        color: ColorSchema.whiteColor.withOpacity(0.7),
        child: CommonTextField(
          onChanged: (val) {},
          // hintText: "Display Name",
          labelText: "Enter your location",
          postfixWid: SvgPicture.asset(
            ImageConstants.locationIcon,
            color: ColorSchema.blackColor,
            height: 25,
            width: 25,
          ),
          inputController: TextEditingController(),
          // focusNode: _accountSetUpController.nameFocusNode,
        ),
      ),
    );
  }

  Align _button() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SaveButton(
        title: (isFromRegister) ? "Next" : "Save",
        onTap: () {
          if (isFromRegister) {
            Get.toNamed(Routes.chooseYourInterestScreen);
          } else {
            Get.back();
          }
        },
        buttonType: ButtonType.enable,
      ),
    );
  }
}
