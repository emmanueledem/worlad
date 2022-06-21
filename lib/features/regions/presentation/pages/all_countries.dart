import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/app/shared/shared_styles.dart';
import 'package:worlad/app/shared/text_style.dart';
import 'package:worlad/app/view_models/regions/region_view_model.dart';
import 'package:worlad/app/widgets/busy_button.dart';
import 'package:worlad/core/navigators/routes.dart';
import 'package:worlad/core/utils/string_utils.dart';
import 'package:worlad/features/regions/data/model/regions_model.dart';
import 'package:worlad/features/regions/presentation/pages/all_states.dart';

class AllCountries extends StatefulWidget {
  const AllCountries({Key? key}) : super(key: key);

  @override
  State<AllCountries> createState() => _AllCountriesState();
}

TextEditingController _searchController = TextEditingController();

class _AllCountriesState extends State<AllCountries> {
  String _searchText = '';
  @override
  void initState() {
    _searchText = _searchController.text.trim();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.trim();
      });
    });
    _handleCountryData();
    super.initState();
  }

  Future<void> _handleCountryData() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<RegionViewModel>(context, listen: false)
          .handlecountry(context: context);
    });
  }

  // @override
  // void dispose() {
  //   _searchController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var regionProvider = Provider.of<RegionViewModel>(context);
    final List<Datum>? _countryList;
    _countryList = _searchText.isEmpty
        ? regionProvider.countryData?.data!
        : regionProvider.countryData?.data!
            .where((item) => item.name!.contains(
                  RegExp(
                    StringUtil.escapeSpecial(_searchText),
                    caseSensitive: false,
                  ),
                ))
            .toList();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Countries',
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
                          await _handleCountryData();
                          setState(() {});
                        })
                  ],
                ),
              )
            : _countryList == null
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.appColour,
                    ),
                  )
                : Column(
                    children: [
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 20),
                          child: TextFormField(
                            controller: _searchController,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontFamily: 'poppins',
                                height: 1.3),
                            decoration: kCountryInputDecorationStyle.copyWith(
                                labelText: 'Search a Country',
                                prefixIcon: const Icon(Icons.search,
                                    color: AppColor.appColour)),
                            autocorrect: true,
                          ),
                        ),
                      ),
                      Expanded(
                          child: _countryList.isNotEmpty
                              ? ListView(
                                  shrinkWrap: true,
                                  children: _countryList
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, Routes.allStatesPage,
                                                arguments: AllStatePram(
                                                    countryName: e.name));
                                          },
                                          child: Card(
                                            child: ListTile(
                                              leading: ClipRRect(
                                                  child: SvgPicture.network(
                                                e.flag.toString(),
                                                width: 100,
                                                fit: BoxFit.fill,
                                                semanticsLabel: 'A shark?!',
                                                placeholderBuilder: (BuildContext
                                                        context) =>
                                                    Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(30.0),
                                                        child:
                                                            const CircularProgressIndicator(
                                                          backgroundColor:
                                                              Colors.redAccent,
                                                        )),
                                              )),
                                              title: Text(
                                                'Name: ' + e.name.toString(),
                                                style: klistTileTitle,
                                              ),
                                              subtitle: Text(
                                                'Abbreviation: ' +
                                                    e.iso3.toString(),
                                                style: kListTileSubtitle,
                                              ),
                                              trailing: const Icon(
                                                Icons.arrow_circle_right,
                                                color: AppColor.appColour,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList())
                              : const Text(
                                  'We can\'t find result for this request')),
                      const Gap(80)
                    ],
                  ));
  }
}
