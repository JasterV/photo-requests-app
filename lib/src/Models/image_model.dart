import 'dart:convert';

class ImageModel{
  int _id;
  String _url;
  String _title;

  ImageModel(this._id, this._url, this._title);

  ImageModel.fromJson(Map<String, dynamic> parsedJson)
  : _id = parsedJson['id'],
    _url = parsedJson['url'],
    _title = parsedJson['title'];


  String get url => _url;

  String get title => _title;

  int get id => _id;
}