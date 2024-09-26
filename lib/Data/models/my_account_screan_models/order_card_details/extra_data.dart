class ExtraData {
  List<dynamic>? previous;
  List<dynamic>? canceled;

  ExtraData({this.previous, this.canceled});

  factory ExtraData.fromJson(Map<String, dynamic> json) => ExtraData(
        previous: json['Previous'] as List<dynamic>?,
        canceled: json['Canceled'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'Previous': previous,
        'Canceled': canceled,
      };
}
