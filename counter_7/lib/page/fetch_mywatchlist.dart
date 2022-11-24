import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist_model.dart';

List<MyWatchListModel> listMyWatchListTotal = [];


Future<List<MyWatchListModel>> fetchMyWatchList() async {
    var url =
        Uri.parse('https://mei-watchlist.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<MyWatchListModel> listMyWatchList = [];
    for (var d in data) {
        if (d != null) {
        listMyWatchList.add(MyWatchListModel.fromJson(d));
        listMyWatchListTotal.add(MyWatchListModel.fromJson(d));
        }
    }
    return listMyWatchList;
}
