import 'package:sleep_baby/core/init/locator.dart';
import 'package:sleep_baby/core/models/base_view_model.dart';
import 'package:sleep_baby/ui/models/res_voice.dart';
import 'package:sleep_baby/ui/repositories/main_repository.dart';

class HomeViewModel extends BaseViewModel {
  final repo = locator<MainRepository>();
  List<ResVoice> listVoice = [];
  int selectedVoiceId = 0;

  getVoices(int categoryId) async {
    state = BaseState.Busy;
    listVoice = await repo.getData(categoryId);
    state = BaseState.Done;
  }

  voiceStop() {
    state = BaseState.Busy;
    selectedVoiceId = 0;
    state = BaseState.Busy;
  }

  changeVoice(int voiceId) {
    state = BaseState.Busy;
    selectedVoiceId = voiceId;
    state = BaseState.Busy;
  }
}
