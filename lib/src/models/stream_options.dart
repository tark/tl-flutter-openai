
@JsonSerializable(explicitToJson: true)
class StreamOptions {
  final Map<String, dynamic>? options;

  StreamOptions({
    this.options,
  });

  factory StreamOptions.fromJson(Map<String, dynamic> json) => _$StreamOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$StreamOptionsToJson(this);
}
