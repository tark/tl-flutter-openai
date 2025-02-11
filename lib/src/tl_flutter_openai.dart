import 'package:tl_flutter_openai/src/models/models.dart';

import 'api/api.dart';

class OpenAI {
  OpenAI({
    required this.apiKey,
    this.organizationId,
    this.projectId,
  }) {
    _api = Api(
      apiKey: apiKey,
      organizationId: organizationId,
      projectId: projectId,
    );
  }

  final String apiKey;
  final String? organizationId;
  final String? projectId;
  late final Api _api;

  Future<dynamic> createChatCompletion(ChatCompletionRequest request) async {
    return _api.createChatCompletion(request);
  }
}
