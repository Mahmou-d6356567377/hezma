import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hezma/UI/presentation/Views/addresses_screan/widgets/districted_place_widget.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/location_botton.dart';
import 'package:hezma/UI/presentation/Views/cart_screan/widgets/text_row.dart';
import 'package:hezma/blocs/district_places_cubit/district_places_cubit.dart';
import 'package:hezma/utils/constants.dart';
import '../../../../utils/fonts.dart';

class AdressesScrean extends StatelessWidget {
  const AdressesScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'العناوين',
          style: arabicstyle2,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const TextRow(title: 'تحديد على الخريطة'),
          const LocatoinBotton(),
          const TextRow(title: 'العناوين المستخدم التوصيل'),
          const DistrictedPlacesWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  BlocBuilder<DistrictPlacesCubit, DistrictPlacesState>(
                    builder: (context, state) {
                      if (state is DistrictPlacesSuccess) {
                        // Assuming your state has a list of places with LatLng data
                        List<Circle> circles = state.districtedPlaces.map((place) {
                          return Circle(
                            circleId: CircleId(place.id.toString()),
                            center: LatLng(double.parse(place.latitude!),double.parse(place.longitude!)),
                            radius: 500, // Adjust radius as needed
                            strokeColor: Colors.green,
                            strokeWidth: 2,
                            fillColor: Colors.green.withOpacity(0.1),
                          );
                        }).toList();

                        return Expanded(
                          flex: 7,
                          child: GoogleMap(
                            circles: Set.from(circles),
                         //  cameraTargetBounds: CameraTargetBounds(LatLngBounds(
                         //    northeast: const LatLng(40, 40),
                         //    southwest: const LatLng(35, 35),
                         //  )),
                            zoomControlsEnabled: false,
                            initialCameraPosition: const CameraPosition(
                                target: LatLng(24.7326759868516, 46.657733877636275),
                                zoom: 5),
                          ),
                        );
                      } else if (state is DistrictPlacesFailure) {
                        print(state.errMsg);
                        return Text(state.errMsg);
                      } else if (state is DistrictPlacesLoading) {
                        return const CircularProgressIndicator();
                      } else {
                        return const Text('!!!!!!!!!!!!');
                      }
                    },
                  ),
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(backgroundcustomgreen2),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              'العناوين المستخدم التوصيل',
                              style: TextStyle(
                                color: Color(backgroundcustomgreen),
                              ),
                            ),
                            Text('الرحمانيه ,الرياض ,السعودية',
                                style: arabicstyle2),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
