import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoImpl {
  final InternetConnectionChecker dataConnectionChecker =
      InternetConnectionChecker();
  // @override
  Future<bool> get isConnected async {
    bool result = await dataConnectionChecker.hasConnection;
    if (result) {
      return true;
    } else {
      return false;
    }
  }
}
