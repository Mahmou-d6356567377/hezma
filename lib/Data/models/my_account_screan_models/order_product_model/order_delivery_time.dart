class OrderDeliveryTime {
  int? id;
  String? dayName;
  String? timeStart;
  String? timeEnd;

  OrderDeliveryTime({this.id, this.dayName, this.timeStart, this.timeEnd});

  factory OrderDeliveryTime.fromJson(Map<String, dynamic> json) {
    return OrderDeliveryTime(
      id: json['id'] as int?,
      dayName: json['day_name'] as String?,
      timeStart: json['time_start'] as String?,
      timeEnd: json['time_end'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'day_name': dayName,
        'time_start': timeStart,
        'time_end': timeEnd,
      };
}
