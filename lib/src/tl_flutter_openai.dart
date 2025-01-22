import 'api/api.dart';

class TlFlutterOpenAI {
  TlFlutterOpenAI({
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

  Future<dynamic> createChatCompletion() async {
    // TBD
  }
}
