
@JsonSerializable(explicitToJson: true)
class Prediction {
  final String? type;
  final Map<String, dynamic>? jsonSchema;

  Prediction({
    this.type,
    this.jsonSchema,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) => _$PredictionFromJson(json);
  Map<String, dynamic> toJson() => _$PredictionToJson(this);
}
