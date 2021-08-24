import 'package:native_admob_flutter/native_admob_flutter.dart';
import 'package:sleep_baby/core/widgets/oe_custom_circular_spinner.dart';

class AdUtil {
  static openIntersititalAd() async {
    final inter = InterstitialAd(unitId: "ca-app-pub-9062473259976457/3846981441");
    await inter.load();
    if (inter.isLoaded) {
      inter.show();
    }
  }

  static openRandomIntersititalAd() async {
    final mls = DateTime.now().microsecond;

    if (mls % 19 == 0) {
      final inter = InterstitialAd(unitId: "ca-app-pub-9062473259976457/9324956253");
      await inter.load();
      if (inter.isLoaded) {
        inter.show();
      }
    }
  }

  static openBannerAd() {
    return BannerAd(
      loading: OeCustomSpinner(),
      size: BannerSize.LEADERBOARD,
      unitId: "ca-app-pub-9062473259976457/1910620224",
    );
  }
}
