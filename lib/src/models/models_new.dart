// import 'package:json_annotation/json_annotation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'models_new.g.dart';
//
// part 'models_new.freezed.dart';
//
// enum AIModel {
//   @JsonValue('o1-mini')
//   o1Mini('o1-mini'),
//   @JsonValue('o1-preview')
//   o1Preview('o1-preview'),
//   @JsonValue('gpt-4o')
//   gpt4o('gpt-4o'),
//   @JsonValue('gpt-4o-mini')
//   gpt4oMini('gpt-4o-mini'),
//   @JsonValue('gpt-4o-audio-preview')
//   gpt4oAudioPreview('gpt-4o-audio-preview'),
//   @JsonValue('gpt-4o-mini-audio-preview')
//   gpt4oMiniAudioPreview('gpt-4o-mini-audio-preview'),
//   @JsonValue('gpt-4turbo-preview')
//   gpt4turboPreview('gpt-4-turbo-preview'),
//   @JsonValue('gpt-4-turbo')
//   gpt4turbo('gpt-4-turbo'),
//   @JsonValue('gpt-4')
//   gpt4('gpt-4'),
//   @JsonValue('chatgpt-4o-latest')
//   chatgpt4oLatest('chatgpt-4o-latest'),
//   @JsonValue('gpt-3.5-turbo')
//   gpt35Turbo('gpt-3.5-turbo');
//
//   final String value;
//
//   const AIModel(this.value);
//
//   @override
//   String toString() => value;
// }
//
// @freezed
// @JsonSerializable(explicitToJson: true, createFactory: false)
// sealed class Message with _$Message {
//   const factory Message({
//     required String role,
//   }) = _Message;
//
//   const factory Message.user({
//     required String content,
//     String? name,
//   }) = UserMessage;
//
//   const factory Message.developer({
//     required String content,
//     String? name,
//   }) = DeveloperMessage;
//
//   const factory Message.system({
//     required String content,
//     String? name,
//   }) = SystemMessage;
//
//   const factory Message.assistant({
//     String? content,
//     String? refusal,
//     String? name,
//     String? audio,
//     String? toolCalls,
//   }) = AssistantMessage;
//
//   factory Message.fromJson(Map<String, Object?> json) =>
//       _$MessageFromJson(json);
//
//   Map<String, dynamic> toJson() => _$MessageToJson(this);
//
// }
//
// @freezed
// @JsonSerializable(explicitToJson: true, createFactory: false)
// class ChatCompletionRequest with _$ChatCompletionRequest{
//   const factory ChatCompletionRequest({
//     required List<Message> messages,
//     required AIModel model,
//     String? store,
//   }) = _ChatCompletionRequest;
//
//   factory ChatCompletionRequest.fromJson(Map<String, Object?> json) =>
//       _$ChatCompletionRequestFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ChatCompletionRequestToJson(this);
//
// }
