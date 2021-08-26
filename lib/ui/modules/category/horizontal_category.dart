import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_baby/core/constants/global_constants.dart';
import 'package:sleep_baby/core/constants/size_constant.dart';
import 'package:sleep_baby/core/widgets/oe_custom_content_text.dart';
import 'package:sleep_baby/ui/modules/home/home_view_model.dart';

import 'category_view_model.dart';

class CategoryHorizontal extends StatelessWidget {
  const CategoryHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Consumer<CategoryViewModel>(
          builder: (context, vModel, child) {
            if (vModel.listCategory.length == 0) {
              return Text("Boş");
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: vModel.listCategory.map((e) => categoryItem(id: e.id, name: e.name)).toList(),
              );
            }
          },
        ));
  }

  Widget categoryItem({required int id, required String name}) {
    return Padding(
      padding: const EdgeInsets.all(SizeConstants.size8),
      child: Consumer<CategoryViewModel>(
        builder: (context, vModel, child) {
          return GestureDetector(
            onTap: () async {
              await vModel.changeCategory(id);
              await Provider.of<HomeViewModel>(context, listen: false).getVoices(id);
            },
            child: Container(
              child: CustomContentText(text: name),
              padding: EdgeInsets.all(SizeConstants.size8),
              decoration: BoxDecoration(
                color: vModel.selectedCategoryId == id ? GlobalConstant.alternativeLive : GlobalConstant.mainSoft.withOpacity(0.3),
                // borderRadius: BorderRadius.circular(SizeConstants.size8),
              ),
            ),
          );
        },
      ),
    );
  }
}
