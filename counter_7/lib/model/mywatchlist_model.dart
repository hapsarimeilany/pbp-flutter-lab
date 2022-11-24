// To parse this JSON data, do
//
//     final myWatchListModel = myWatchListModelFromJson(jsonString);

import 'dart:convert';

List<MyWatchListModel> myWatchListModelFromJson(String str) => 
    List<MyWatchListModel>.from(
        json.decode(str).map((x) => MyWatchListModel.fromJson(x))
    );

String myWatchListModelToJson(List<MyWatchListModel> data) => 
    json.encode(
        List<dynamic>.from(data.map((x) => x.toJson()))
    );

class MyWatchListModel {
    MyWatchListModel({
        required this.model,
        required this.fields,
    });

    Model? model;
    Fields fields;

    factory MyWatchListModel.fromJson(Map<String, dynamic> json) => MyWatchListModel(
        model: modelValues.map[json["model"]]!,
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.title,
        required this.watched,
        required this.rating,
        required this.releaseDate,
        required this.review,
    });

    String title;
    String watched;
    int rating;
    String releaseDate;
    String review;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        title: json["title"],
        watched: json["watched"],
        rating: json["rating"],
        releaseDate: json["release_date"],
        review: json["review"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "watched": watchedValues.reverse[watched],
        "rating": rating,
        "release_date": releaseDate,
        "review": review,
    };
}

enum Watched { NOT_WATCHED, WATCHED }

final watchedValues = EnumValues({
    "not watched": Watched.NOT_WATCHED,
    "Watched": Watched.WATCHED
});

enum Model { MYWATCHLIST_WATCHLIST }

final modelValues = EnumValues({
    "mywatchlist.watchlist": Model.MYWATCHLIST_WATCHLIST
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
