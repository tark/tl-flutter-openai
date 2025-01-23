abstract class Message {}

enum MessageRoles { developer, system, user, assistant, tool }

class DeveloperMessage extends Message {
  final String content;
  final String role;
  final String? name;

  DeveloperMessage({
    required this.content,
    required this.role,
    this.name,
  });

}

class SystemMessage extends Message {
  final String content;
  final String role;
  final String? name;

  SystemMessage({
    required this.content,
    required this.role,
    this.name,
  });
}

class AssistantMessage extends Message {
  final String content;
  final String role;
  final String? name;

  AssistantMessage({
    required this.content,
    required this.role,
    this.name,
  });
}

class ResponseFormat {
  final String? type;
  final Map<String, dynamic>? jsonSchema;

  ResponseFormat({
    this.type,
    this.jsonSchema,
  });
}

class Prediction {
  final String? type;
  final Map<String, dynamic>? jsonSchema;

  Prediction({
    this.type,
    this.jsonSchema,
  });
}

class ToolChoice {
  final String? type;
  final Map<String, dynamic>? function;

  ToolChoice({
    this.type,
    this.function,
  });
}

class StreamOptions {
  final Map<String, dynamic>? options;

  StreamOptions({
    this.options,
  });
}

