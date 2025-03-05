// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemMessage _$SystemMessageFromJson(Map<String, dynamic> json) =>
    SystemMessage(
      content: json['content'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SystemMessageToJson(SystemMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'name': instance.name,
    };

UserMessage _$UserMessageFromJson(Map<String, dynamic> json) => UserMessage(
      content: json['content'] as String?,
      contentParts: (json['contentParts'] as List<dynamic>?)
          ?.map((e) => ContentPart.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserMessageToJson(UserMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'contentParts': instance.contentParts?.map((e) => e.toJson()).toList(),
      'name': instance.name,
    };

AssistantMessage _$AssistantMessageFromJson(Map<String, dynamic> json) =>
    AssistantMessage(
      refusal: json['refusal'] as String?,
      name: json['name'] as String?,
      audio: json['audio'] == null
          ? null
          : AssistantMessageAudio.fromJson(
              json['audio'] as Map<String, dynamic>),
      toolCalls: (json['toolCalls'] as List<dynamic>?)
          ?.map((e) => ToolCall.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssistantMessageToJson(AssistantMessage instance) =>
    <String, dynamic>{
      'refusal': instance.refusal,
      'name': instance.name,
      'audio': instance.audio?.toJson(),
      'toolCalls': instance.toolCalls?.map((e) => e.toJson()).toList(),
    };

AssistantMessageAudio _$AssistantMessageAudioFromJson(
        Map<String, dynamic> json) =>
    AssistantMessageAudio(
      id: json['id'] as String,
    );

Map<String, dynamic> _$AssistantMessageAudioToJson(
        AssistantMessageAudio instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

ToolCall _$ToolCallFromJson(Map<String, dynamic> json) => ToolCall(
      id: json['id'] as String,
      type: json['type'] as String,
      function:
          ToolCallFunction.fromJson(json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToolCallToJson(ToolCall instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'function': instance.function.toJson(),
    };

ToolCallFunction _$ToolCallFunctionFromJson(Map<String, dynamic> json) =>
    ToolCallFunction(
      name: json['name'] as String,
      arguments: json['arguments'] as String,
    );

Map<String, dynamic> _$ToolCallFunctionToJson(ToolCallFunction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'arguments': instance.arguments,
    };

TextContentPart _$TextContentPartFromJson(Map<String, dynamic> json) =>
    TextContentPart(
      text: json['text'] as String,
    );

Map<String, dynamic> _$TextContentPartToJson(TextContentPart instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

ImageContentPart _$ImageContentPartFromJson(Map<String, dynamic> json) =>
    ImageContentPart(
      imageUrl: ImageUrl.fromJson(json['imageUrl'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageContentPartToJson(ImageContentPart instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl.toJson(),
    };

ImageUrl _$ImageUrlFromJson(Map<String, dynamic> json) => ImageUrl(
      url: json['url'] as String,
      detail: json['detail'] as String,
    );

Map<String, dynamic> _$ImageUrlToJson(ImageUrl instance) => <String, dynamic>{
      'url': instance.url,
      'detail': instance.detail,
    };

AudioContentPart _$AudioContentPartFromJson(Map<String, dynamic> json) =>
    AudioContentPart(
      imageUrl: ImageUrl.fromJson(json['imageUrl'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AudioContentPartToJson(AudioContentPart instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl.toJson(),
    };
