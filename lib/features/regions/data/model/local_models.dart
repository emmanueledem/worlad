class LocalCountryModel {
  LocalCountryModel({
    this.id,
    required this.countryName,
    required this.flag,
    required this.iso3,
  });
  int? id;
  String? countryName;
  String? flag;
  String? iso3;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'countryName': countryName,
      'flag': flag,
      'iso3': iso3,
    };
  }

  LocalCountryModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        countryName = res["countryName"],
        flag = res["flag"],
        iso3 = res["iso3"];
}
