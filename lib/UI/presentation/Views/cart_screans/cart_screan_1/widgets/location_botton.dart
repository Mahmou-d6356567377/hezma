import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hezma/Data/models/my_account_screan_models/addresses/data.dart';
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/del_address_cubit/del_address_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/get_addresses_cubit/get_addresses_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';
import 'package:hezma/utils/routes.dart';

class LocatoinBotton extends StatefulWidget {
  final Function(AddressData) addressSelected;

  const LocatoinBotton({super.key, required this.addressSelected});

  @override
  _LocatoinBottonState createState() => _LocatoinBottonState();
}

class _LocatoinBottonState extends State<LocatoinBotton> {
  String selectedAddressName =
      'إضافة عنوان جديد'; // Default text for the button

  @override
  Widget build(BuildContext context) {
    // Fetch addresses when the widget is built
    context.read<GetAddressesCubit>().fetchAddresses();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GestureDetector(
        onTap: () {
          // Show bottom sheet to display addresses
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return BlocBuilder<GetAddressesCubit, GetAddressesState>(
                builder: (context, state) {
                  if (state is GetAddressesSuccess) {
                    return Column(
                      children: [
                        // List of addresses
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.dataAddress.length,
                            itemBuilder: (context, index) {
                              final item = state.dataAddress[index];
                              return GestureDetector(
                                onTap: () {
                                  // Update selected address name and pass the address to parent
                                  setState(() {
                                    selectedAddressName = item.name!;
                                  });
                                  widget.addressSelected(item);
                                  Navigator.pop(
                                      context); // Close the bottom sheet
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  width: double.infinity,
                                  decoration: customBoxDecoration2,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          item.name!,
                                          style: arabicstyle2,
                                        ),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          GoRouter.of(context)
                                              .push(AppRoutes.eas, extra: item);
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Color(backgroundcustomgreen2),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          context
                                              .read<DelAddressCubit>()
                                              .delAddresses(id: item.id!);
                                          context
                                              .read<GetAddressesCubit>()
                                              .fetchAddresses();
                                        },
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // Close button
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the modal
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(backgroundcustomgreen2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text(
                              'إغلاق',
                              style: arabicstyle5,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is GetAddressesFailure) {
                    return Center(child: Text(state.errMsg));
                  } else {
                    return const Center(child: LinearProgressIndicator());
                  }
                },
              );
            },
          );
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color(darkwhite),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.location_on,
                  color: Color(backgroundcustomgreen2),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  selectedAddressName, // Display the selected address name
                  style: arabicstyle3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
