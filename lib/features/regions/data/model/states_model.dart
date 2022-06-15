
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
    List<State>? states;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        iso3: json["iso3"],
        states: List<State>.from(json["states"].map((x) => State.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "iso3": iso3,
        "states": List<dynamic>.from(states!.map((x) => x.toJson())),
    };
}

class State {
    State({
        this.name,
        this.stateCode,
    });

    String? name;
    String? stateCode;

    factory State.fromJson(Map<String, dynamic> json) => State(
        name: json["name"],
        stateCode: json["state_code"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "state_code": stateCode,
    };
}
