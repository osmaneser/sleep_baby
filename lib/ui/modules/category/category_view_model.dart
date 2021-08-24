
import 'package:sleep_baby/core/models/base_view_model.dart';
import '../../models/res_category.dart';

class CategoryViewModel extends BaseViewModel {
  int selectedCategoryId = 0;
  final listCategory = [
    ResCategory(id: 0, name: "Tümü"),
    ResCategory(id: 1, name: "Atatürk"),
    ResCategory(id: 2, name: "Ottoman"),
    ResCategory(id: 3, name: "Germany"),
    ResCategory(id: 4, name: "Netherlands"),
    ResCategory(id: 5, name: "Scotland"),
    ResCategory(id: 6, name: "Orman"),
    ResCategory(id: 7, name: "Spain"),
  ];

  Future<void> changeCategory(int id) async {
    state = BaseState.Busy;
    selectedCategoryId = id;
    state = BaseState.Done;
  }
}
