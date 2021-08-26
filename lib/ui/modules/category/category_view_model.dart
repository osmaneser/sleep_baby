import 'package:sleep_baby/core/init/locator.dart';
import 'package:sleep_baby/core/models/base_view_model.dart';
import 'package:sleep_baby/ui/repositories/main_repository.dart';
import '../../models/res_category.dart';

class CategoryViewModel extends BaseViewModel {
  final repo = locator<MainRepository>();
  int selectedCategoryId = 0;
  List<ResCategory> listCategory = [];

  CategoryViewModel() {
    getCategories();
  }

  Future<void> getCategories() async {
    state = BaseState.Busy;
    final result = await repo.getCategories();
    listCategory = result;
    state = BaseState.Done;
  }

  Future<void> changeCategory(int id) async {
    state = BaseState.Busy;
    selectedCategoryId = id;
    state = BaseState.Done;
  }
}
