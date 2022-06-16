const tableCountries = 'countries';


class CountryFields {
  static final List<String> values = [
    id,
    image,
    countryName,
    abbreviation,
  ];

  static const String id = 'id';
  static const String countryName = 'countryName';
  static const String image = 'image';
  static const String abbreviation = 'abbreviation';
}



class RegionModel {
    RegionModel({
        this.error,
        this.msg,
        this.data,
    });

    bool? error;
    String? msg;
    List<Datum>? data;

    factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
        error: json["error"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.name,
        this.flag,
        this.iso2,
        this.iso3,
    });

    String? name;
    String? flag;
    String? iso2;
    String? iso3;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        flag: json["flag"],
        iso2: json["iso2"],
        iso3: json["iso3"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "flag": flag,
        "iso2": iso2,
        "iso3": iso3,
    };
}






class StateModel {
    StateModel({
        this.error,
        this.msg,
        this.data,
    });

    bool? error;
    String? msg;
    Data? data;

    factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        error: json["error"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.name,
        this.iso3,
        this.states,
    });

    String? name;
    String? iso3;
    List<States>? states;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        iso3: json["iso3"],
        states: List<States>.from(json["states"].map((x) => States.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "iso3": iso3,
        "states": List<dynamic>.from(states!.map((x) => x.toJson())),
    };
}

class States {
    States({
        this.name,
        this.stateCode,
    });

    String? name;
    String? stateCode;

    factory States.fromJson(Map<String, dynamic> json) => States(
        name: json["name"],
        stateCode: json["state_code"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "state_code": stateCode,
    };
}
