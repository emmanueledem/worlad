
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
