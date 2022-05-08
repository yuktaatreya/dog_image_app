import 'package:uuid/uuid.dart';
class UserImage {
  int? fileSizeBytes;
  String url='';
  final String id=Uuid().v1().toString();

  UserImage({this.fileSizeBytes, required this.url});

  UserImage.fromJson(Map<String, dynamic> json) {
    fileSizeBytes = json['fileSizeBytes'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileSizeBytes'] = this.fileSizeBytes;
    data['url'] = this.url;
    data['id']=this.id;
    return data;
  }
}