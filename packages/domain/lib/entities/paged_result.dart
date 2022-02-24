import 'package:domain/entities/result_information.dart';

class PagedResult<T> {
  ResultInformation? information;
  List<T>? results;

  PagedResult({
    this.information,
    this.results,
  });
}
