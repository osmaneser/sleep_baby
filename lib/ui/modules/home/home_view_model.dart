import 'package:audio_service/audio_service.dart';
import 'package:sleep_baby/core/init/locator.dart';
import 'package:sleep_baby/core/models/base_view_model.dart';
import 'package:sleep_baby/ui/models/res_voice.dart';
import 'package:sleep_baby/ui/modules/home/home_page.dart';
import 'package:sleep_baby/ui/repositories/main_repository.dart';
import 'package:sleep_baby/ui/services/audio_player_service.dart';

class HomeViewModel extends BaseViewModel {
  final repo = locator<MainRepository>();
  List<ResVoice> listVoice = [];

  getVoices(int categoryId) async{
    state = BaseState.Busy;
    listVoice = await repo.getData(categoryId);
    state = BaseState.Done;
  }
}
