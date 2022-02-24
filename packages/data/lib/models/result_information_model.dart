class ResultInformationModel {
  int? count;
  int? pages;
  String? nextUrl;
  String? prevUrl;

  ResultInformationModel({
    this.count,
    this.pages,
    this.nextUrl,
    this.prevUrl,
  });

  static ResultInformationModel fromJson(dynamic json) => ResultInformationModel(
    count: json['count'],
    pages: json['pages'],
    nextUrl: json['next'],
    prevUrl: json['prev'],
  );
}
