import 'dart:async';
import 'package:climb_app_base/components/item_places.dart';
import 'package:climb_app_base/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../components/text_style.dart';
import '../../data/event_bus/hide_map_event.dart';
import '../../data/list_places_model.dart';

class TabPlaces extends StatefulWidget {
  final Function(bool) onCallBackShowMap;

  const TabPlaces({Key? key, required this.onCallBackShowMap})
      : super(key: key);

  @override
  State<TabPlaces> createState() => _TabPlacesState();
}

class _TabPlacesState extends State<TabPlaces> {
  var lPlaces = [
    PlacesModel(
        namePlace: 'Hardwalls',
        nameCity: 'Warsaw',
        distance: 2.2,
        lat: 21.0484124195535,
        lng: 105.80959985686454),
    PlacesModel(
        namePlace: 'AAAAAA',
        nameCity: 'aaa',
        distance: 3.2,
        lat: 21.061288097479334,
        lng: 105.80934959954087),
    PlacesModel(
        namePlace: 'BBBBBB',
        nameCity: 'bbb',
        distance: 4.2,
        lat: 21.079085115322442,
        lng: 105.8124170251354),
    PlacesModel(
      namePlace: 'CCCCC',
      nameCity: 'ccc',
      distance: 4.2,
      lat: 21.04402607922795,
      lng: 105.83373275717862,
    ),
    PlacesModel(
      namePlace: 'DDDDD',
      nameCity: 'ddd',
      distance: 4.2,
      lat: 21.042763054966294,
      lng: 105.8248191801123,
    ),
    PlacesModel(
        namePlace: 'EEEE',
        nameCity: 'eee',
        distance: 4.2,
        lat: 21.037624617195576,
        lng: 105.8198666674366),
  ];
  bool isShowMap = false;
  Completer<GoogleMapController> _controller = Completer();

  late CameraPosition _kGooglePlex;
  final Set<Marker> markers = new Set();
  StreamSubscription<HideMapEvent>? _hideMapStream;

  @override
  void initState() {
    _hideMapStream = Utils.eventBus.on<HideMapEvent>().listen((event) {
      isShowMap = false;
      setState(() {});
    });
    _kGooglePlex = CameraPosition(
        target: LatLng(lPlaces[0].lat, lPlaces[0].lng), zoom: 15);
    for (int i = 0; i < lPlaces.length; i++) {
      markers.add(Marker(
          markerId: MarkerId(i.toString()),
          position: LatLng(lPlaces[i].lat, lPlaces[i].lng)));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xFF282D2F),
      child: Stack(
        children: [
          GoogleMap(
            markers: markers,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            scrollGesturesEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Visibility(
            child: Container(
              height: size.height,
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10),
                itemBuilder: (BuildContext context, int index) {
                  return ItemPlaces(model: lPlaces[index]);
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 10.h,
                ),
                itemCount: lPlaces.length,
              ),
              color: Color(0xFF3B4244),
            ),
            visible: !isShowMap,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20.h),
            alignment: Alignment.bottomCenter,
            child: OutlinedButton(
              onPressed: () {
                isShowMap = !isShowMap;
                widget.onCallBackShowMap(isShowMap);
                setState(() {});
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                side: MaterialStateProperty.all(
                  BorderSide(color: Colors.deepOrange, width: 1),
                ),
                fixedSize: MaterialStateProperty.all(
                  Size(100.w, 35.h),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              child: isShowMap
                  ? Row(
                      children: [
                        Icon(
                          Icons.menu,
                          color: Colors.deepOrange,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        AppText(
                          msg: 'List',
                          style: TextStyle(color: Colors.deepOrange),
                        )
                      ],
                    )
                  : Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.deepOrange,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        AppText(
                          msg: 'Map',
                          style: TextStyle(color: Colors.deepOrange),
                        )
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
