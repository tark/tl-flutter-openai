import 'package:json_annotation/json_annotation.dart';

import 'message.dart';

part 'chat_completion_response.g.dart';

/*
{
   "id":"chatcmpl-B16WJRL6AjOo3zMVnDAPSoDSz7u5F",
   "object":"chat.completion",
   "created":1739603091,
   "model":"chatgpt-4o-latest",
   "choices":[
      {
         "index":0,
         "message":{
            "role":"assistant",
            "content":"Hi! Welcome! 😊 How can I assist you today?",
            "refusal":null
         },
         "logprobs":null,
         "finish_reason":"stop"
      }
   ],
   "usage":{
      "prompt_tokens":17,
      "completion_tokens":12,
      "total_tokens":29,
      "prompt_tokens_details":{
         "cached_tokens":0,
         "audio_tokens":0
      },
      "completion_tokens_details":{
         "reasoning_tokens":0,
         "audio_tokens":0,
         "accepted_prediction_tokens":0,
         "rejected_prediction_tokens":0
      }
   },
   "service_tier":"default",
   "system_fingerprint":"fp_4543fc7ef9"
}
 */
@JsonSerializable()
class ChatCompletionResponse {
  final String? id;
  final String? object;
  final int? created;
  final String? model;
  final String? serviceTier;
  final String? systemFingerprint;
  final List<Choice>? choices;
  final Usage? usage;

  ChatCompletionResponse({
     this.id,
     this.object,
     this.created,
     this.model,
    this.serviceTier,
     this.systemFingerprint,
     this.choices,
     this.usage,
  });

  factory ChatCompletionResponse.fromJson(Map<String, dynamic> json) => _$ChatCompletionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatCompletionResponseToJson(this);
}

@JsonSerializable()
class Choice {
  final int? index;
  final String? finishReason;
  final Message? message;
  final Logprobs? logprobs;

  Choice({
     this.index,
     this.finishReason,
     this.message,
    this.logprobs,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}

// @JsonSerializable()
// class Message {
//   final String? content;
//   final String? role;
//
//   Message({ this.content,  this.role});
//
//   factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
//   Map<String, dynamic> toJson() => _$MessageToJson(this);
// }

@JsonSerializable()
class Logprobs {
  // Define logprob structure if needed
  Logprobs();

  factory Logprobs.fromJson(Map<String, dynamic> json) => _$LogprobsFromJson(json);
  Map<String, dynamic> toJson() => _$LogprobsToJson(this);
}

@JsonSerializable()
class Usage {
  final int? completionTokens;
  final int? promptTokens;
  final int? totalTokens;
  final TokenDetails? completionTokensDetails;
  final TokenDetails? promptTokensDetails;

  Usage({
     this.completionTokens,
     this.promptTokens,
     this.totalTokens,
     this.completionTokensDetails,
     this.promptTokensDetails,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
  Map<String, dynamic> toJson() => _$UsageToJson(this);
}

@JsonSerializable()
class TokenDetails {
  final int? acceptedPredictionTokens;
  final int? audioTokens;
  final int? reasoningTokens;
  final int? rejectedPredictionTokens;
  final int? cachedTokens;

  TokenDetails({
     this.acceptedPredictionTokens,
     this.audioTokens,
     this.reasoningTokens,
     this.rejectedPredictionTokens,
     this.cachedTokens,
  });

  factory TokenDetails.fromJson(Map<String, dynamic> json) => _$TokenDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$TokenDetailsToJson(this);
}
