
import 'dart:convert';

ResCategory resCategoryFromJson(String str) => ResCategory.fromJson(json.decode(str));

String resCategoryToJson(ResCategory data) => json.encode(data.toJson());

class ResCategory {
    ResCategory({
        required this.id,
        required this.name,
    });

    int id;
    String name;

    factory ResCategory.fromJson(Map<String, dynamic> json) => ResCategory(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
