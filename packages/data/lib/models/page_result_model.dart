import 'package:core/resources/types.dart';
import 'package:data/models/result_information_model.dart';

class PagedResultModel<T> {
  ResultInformationModel? information;
  List<T>? results;

  PagedResultModel({
    this.information,
    this.results,
  });

  static PagedResultModel<T> fromJson<T>(
    dynamic json,
    Mapper<T> mapper,
  ) =>
      PagedResultModel<T>(
        information: json['info'] != null ? ResultInformationModel.fromJson(json['info']) : null,
        results: json['results'] != null ? (json['results'] as List).map((obj) => mapper(obj)).toList() : null,
      );
}
