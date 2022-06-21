import 'package:flutter/material.dart';
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
import 'package:worlad/features/regions/presentation/pages/all_cities.dart';

class AllStates extends StatefulWidget {
  const AllStates({Key? key, required this.params}) : super(key: key);
  final AllStatePram? params;
  @override
  State<AllStates> createState() => _AllStatesState();
}

class _AllStatesState extends State<AllStates> {
  final TextEditingController _stateController = TextEditingController();

  String _searchText = '';
  @override
  void initState() {
    _searchText = _stateController.text.trim();
    _stateController.addListener(() {
      setState(() {
        _searchText = _stateController.text.trim();
      });
    });
    _handleStateData();
    super.initState();
  }

  Future<void> _handleStateData() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<RegionViewModel>(context, listen: false).handlestates(
          context: context, countryname: widget.params?.countryName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var regionProvider = Provider.of<RegionViewModel>(context);
    List<States>? _statesList;
    if (regionProvider.stateData?.data!.states != null) {
      _statesList = (_searchText.isEmpty
          ? regionProvider.stateData?.data!.states!
          : regionProvider.stateData?.data!.states!
              .where((item) => item.name!.contains(
                    RegExp(
                      StringUtil.escapeSpecial(_searchText),
                      caseSensitive: false,
                    ),
                  ))
              .toList());
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: AppColor.appColour,
          centerTitle: true,
          title: const Text(
            'States',
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
                          await _handleStateData();
                          setState(() {});
                        })
                  ],
                ),
              )
            : _statesList == null
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(113, 1, 147, 1),
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 20),
                        child: TextFormField(
                          controller: _stateController,
                          validator: (String? value) {
                            return (value == null || value.isEmpty)
                                ? 'State Name is required'
                                : null;
                          },
                          style: const TextStyle(
                              color: Colors.black87,
                              fontFamily: 'poppins',
                              height: 1.3),
                          decoration: kCountryInputDecorationStyle.copyWith(
                              labelText: 'Search a State',
                              prefixIcon: const Icon(Icons.search,
                                  color: AppColor.appColour)),
                          autocorrect: true,
                        ),
                      ),
                      Expanded(
                          child: _statesList.isNotEmpty
                              ? ListView(
                                  shrinkWrap: true,
                                  children: _statesList
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, Routes.allcitiesPage,
                                                arguments: AllCitiesPram(
                                                    countryName: widget
                                                        .params!.countryName,
                                                    stateName: e.name));
                                          },
                                          child: Card(
                                            child: ListTile(
                                              title: Text(
                                                'Name: ' + e.name.toString(),
                                                style: klistTileTitle,
                                              ),
                                              subtitle: Text(
                                                'State Id: ' +
                                                    e.stateCode.toString(),
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
                                      .toList(),
                                )
                              : const Text(
                                  'We can\'t find result for this request')),
                    ],
                  ));
  }
}

class AllStatePram {
  AllStatePram({required this.countryName});
  final String? countryName;
}
