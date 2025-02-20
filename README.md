# Tark Laboratory Flutter OpenAI Client

This is an unofficial Dart client for [OpenAI](https://platform.openai.com/docs/api-reference) API.

![Demo](assets/demo.gif)

<img src="assets/demo.gif" width="400" alt="Demo">

## Features

- Fully compatible with the official [OpenAI API](https://github.com/openai/openai-openapi)
- Fully type-safe
- Authentication with organization support

### Supported endpoints

- Chat completions

### Endpoints in progress

- Embeddings
- Fine-tuning
- Batch
- Images
- Models
- Moderations

## Table of contents

- [Usage](#usage)
    * [Authentication](#authentication)
        + [Organization (optional)](#organization-optional)
    * [Chat](#chat)
    * [Completions (legacy)](#completions-legacy)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Usage

### Authentication

To authenticate in, you will need a key. You can get it from your personal account [settings](https://platform.openai.com/account/api-keys).

> **Remember that your API key is a secret!** 
> 
> Do not share it with others or expose it in any client-side code (browsers, apps). Production requests must be routed through your own backend server where your API key can be securely loaded from an environment variable or key management service.

```dart
final openAI = OpenAI(
  apiKey: dotenv.env['OPENAI_API_KEY'],
);
```

#### Organization (optional)

For users who belong to multiple organizations or are accessing their projects through their legacy user API key, you can pass a header to specify which organization and project is used for an API request. Usage from these API requests will count as usage for the specified organization and project.

```dart
final openAI = OpenAI(
  apiKey: dotenv.env['OPENAI_API_KEY'],
  organizationId: dotenv.env['OPENAI_ORGANIZATION_ID'],
  projectId: dotenv.env['OPENAI_PROJECT_ID'],
);
```

### Chat

Given a list of messages comprising a conversation, the model will return a response.

Related guide: [Chat Completions](https://platform.openai.com/docs/guides/chat-completions)

**Create chat completion:**

```dart

final response = await openAI.createChatCompletion(ChatCompletionRequest(
  model: AIModel.chatgpt4oLatest,
  messages: [
    SystemMessage(
      content: 'You are a friend',
    ),
    UserMessage(
      content: 'Hey, how are you?',
    ),
  ],
));

print(response.choices.first.message.content);
// Hello! How can I assist you today?

```
              
- `ChatCompletionRequest` is the main object used for making the Chat completion call
- `AIModel.chatgpt4oLatest` is a model from `AIModel` enum which lists all of the available models.
- You can use different types of messages like `SystemMessage`, `UserMessage`, `AssistantMessage`, `ToolMessage`, `FunctionMessage` and `MultiModalMessage` to create a conversation.


## License

TL OpenAI Dart Client is licensed under the [MIT License](https://github.com/davidmigloz/langchain_dart/blob/main/LICENSE).
