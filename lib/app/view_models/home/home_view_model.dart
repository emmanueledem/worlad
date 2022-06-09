import 'package:flutter/material.dart';
import 'package:worlad/app/view_models/base_view_model.dart';
import 'package:worlad/app/widgets/flush_bar.dart';

import '../../../core/network/network.dart';

class HomeViewModel extends BaseViewModel {
  final NetworkInfoImpl _connectivityInfo = NetworkInfoImpl();
  Future checkNewtwork({required BuildContext context}) async {
    setBusy(true);
    if (await _connectivityInfo.isConnected) {
    } else {
      FlushBarNotification.showError(
          context, 'No Internet Connection Detected.', 'Network Error!');
    }
    setBusy(false);
  }
}
