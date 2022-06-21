import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/app/shared/shared_styles.dart';
import 'package:worlad/app/shared/text_style.dart';
import 'package:worlad/app/view_models/regions/region_view_model.dart';
import 'package:worlad/app/widgets/busy_button.dart';
import 'package:worlad/core/utils/string_utils.dart';

class AllCities extends StatefulWidget {
  const AllCities({Key? key, this.params}) : super(key: key);
  final AllCitiesPram? params;
  @override
  State<AllCities> createState() => _AllCitiesState();
}

class _AllCitiesState extends State<AllCities> {
  final TextEditingController _citiesController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    _searchText = _citiesController.text.trim();
    _citiesController.addListener(() {
      setState(() {
        _searchText = _citiesController.text.trim();
      });
    });
    _handleCitiesData();
    super.initState();
  }

  Future<void> _handleCitiesData() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<RegionViewModel>(context, listen: false).handleCities(
          statename: widget.params?.stateName,
          context: context,
          countryname: widget.params?.countryName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var regionProvider = Provider.of<RegionViewModel>(context);
    List<String>? _citiesList;
    if (regionProvider.citiesData?.data != null) {
      _citiesList = _searchText.isEmpty
          ? regionProvider.citiesData?.data!
          : regionProvider.citiesData?.data!
              .where((item) => item.contains(
                    RegExp(
                      StringUtil.escapeSpecial(_searchText),
                      caseSensitive: false,
                    ),
                  ))
              .toList();
    }
                                                                                                                                                                                                                                                                                                       
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          foregroundColor: AppColor.appColour,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Cities',
            style: TextStyle(
                color: Color(0xff0A191E),
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontFamily: 'poppins'),
          ),
        ),
        body: regionProvider.isNotAccessd == false
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Opps somethings went wrong...',
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    const Gap(10),
                    AppBusyButton(
                        butttonText: 'Retry',
                        onpressed: () async {
                          await _handleCitiesData();
                          setState(() {});
                        })
                  ],
                ),
              )
            : _citiesList == null
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.appColour,
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 20),
                        child: TextFormField(
                          controller: _citiesController,
                          validator: (String? value) {
                            return (value == null || value.isEmpty)
                                ? 'City Name is required'
                                : null;
                          },
                          style: const TextStyle(
                              color: Colors.black87,
                              fontFamily: 'poppins',
                              height: 1.3),
                          decoration: kCountryInputDecorationStyle.copyWith(
                              labelText: 'Search a City',
                              prefixIcon: const Icon(Icons.search,
                                  color: AppColor.appColour)),
                          autocorrect: true,
                        ),
                      ),
                      Expanded(
                          child: _citiesList.isNotEmpty
                              ? ListView(
                                  shrinkWrap: true,
                                  children: _citiesList
                                      .map(
                                        (e) => Card(
                                          child: ListTile(
                                            title:
                                                Text(e, style: klistTileTitle),
                                            // subtitle: const Text(
                                            //   'City Type: Capital, population: 4378, timezone: Africa/Lusaka',
                                            //   style: kListTileSubtitle,
                                            // ),
                                            // isThreeLine: true,
                                          ),
                                        ),
                                      )
                                      .toList())
                              : const Text(
                                  'We can\'t find result for this request')),
                    ],
                  ));
  }
}

class AllCitiesPram {
  AllCitiesPram({required this.countryName, required this.stateName});
  final String? countryName;
  final String? stateName;
}
