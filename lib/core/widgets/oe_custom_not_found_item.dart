import 'package:flutter/material.dart';
import '../../core/widgets/oe_custom_title_text.dart';
import '../constants/global_constants.dart';
import '../widgets/oe_button.dart';

class OeCustomNotFoundItem extends StatelessWidget {
  final bool isReloadData;
  final String reloadDataText;
  final void Function()? onReload;

  const OeCustomNotFoundItem({Key? key, this.isReloadData = false, this.onReload, this.reloadDataText = "Load Data"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTitleText(text: "Veri Bulunamadı"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.info,
              size: 72,
              color: GlobalConstant.fontColorLive,
            ),
          ),
          isReloadData
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OeButton(
                      onTap: () => onReload,
                      text: reloadDataText),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
