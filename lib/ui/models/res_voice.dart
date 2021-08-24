import 'dart:convert';

ResVoice resVoiceFromJson(String str) => ResVoice.fromJson(json.decode(str));

String resVoiceToJson(ResVoice data) => json.encode(data.toJson());

class ResVoice {
    ResVoice({
        required this.id,
        required this.name,
        required this.voiceUrl,
        required this.categoryId,
    });

    int id;
    String name;
    String voiceUrl;
    int categoryId;

    factory ResVoice.fromJson(Map<String, dynamic> json) => ResVoice(
        id: json["id"],
        name: json["name"],
        voiceUrl: json["voiceUrl"],
        categoryId: json["categoryId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "voiceUrl": voiceUrl,
        "categoryId": categoryId,
    };
}
