class settingModel1 {
  String? name;
  String? value;

  settingModel1({this.name, this.value});

  factory settingModel1.fromJson(Map<String, dynamic> json) => settingModel1(
        name: json['name'] as String?,
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
      };
}
