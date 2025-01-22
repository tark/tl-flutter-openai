
@JsonSerializable(explicitToJson: true)
class ResponseFormat {
  final String? type;
  final Map<String, dynamic>? jsonSchema;

  ResponseFormat({
    this.type,
    this.jsonSchema,
  });

  factory ResponseFormat.fromJson(Map<String, dynamic> json) => _$ResponseFormatFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseFormatToJson(this);
}
