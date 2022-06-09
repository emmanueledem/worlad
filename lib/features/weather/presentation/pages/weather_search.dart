import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/app/shared/shared_styles.dart';
import 'package:worlad/app/widgets/busy_button.dart';
import 'package:worlad/app/widgets/flush_bar.dart';
import '../../../../core/network/connectivity_info.dart';

class WeatherSearch extends StatefulWidget {
  const WeatherSearch({Key? key}) : super(key: key);

  @override
  State<WeatherSearch> createState() => _WeatherSearchState();
}

final _formKey = GlobalKey<FormState>();
final NetworkInfoImpl _connectivityInfo = NetworkInfoImpl();

class _WeatherSearchState extends State<WeatherSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.clear_outlined,
                color: AppColor.appColour,
              ))
        ],
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: ModalProgressHUD(
        inAsyncCall: false,
        child: SafeArea(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 21, vertical: 40),
                      child: TextFormField(
                        validator: (String? value) {
                          return (value == null || value.isEmpty)
                              ? 'Location is required'
                              : null;
                        },
                        style: const TextStyle(
                            color: Colors.black87,
                            fontFamily: 'poppins',
                            height: 1.3),
                        decoration: kCountryInputDecorationStyle.copyWith(
                            labelText: 'Search a Location',
                            prefixIcon: const Icon(Icons.search,
                                color: AppColor.appColour)),
                      ),
                    ),
                    AppBusyButton(
                      butttonText: "Search a Location",
                      onpressed: () async {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        // if (_formKey.currentState!.validate()) {

                        if (await _connectivityInfo.isConnected) {
                          //     value = _locationNameController.text;
                          //     await weatherProvider.fetchLocation(value);
                          //     if (weatherProvider.ifCountryExist == true) {
                          // Navigator.pushNamed(context, Routes.weatherResultPage);
                          Logger().d('Helo');
                          //       _locationNameController.clear();
                          //     }
                        } else {
                          FlushBarNotification.showError(
                              context,
                              'No Internet Connection Detected',
                              'Network Error!');
                        }
                        // }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // weatherProvider.ifCountryExist == false
                    // ? const Center(
                    //     child: Text(
                    //     'This Location does not exist',
                    //     style: TextStyle(color: Colors.red, fontSize: 15),
                    //   ))
                    // : const Text(''),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
