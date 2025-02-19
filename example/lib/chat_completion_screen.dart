import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tl_flutter_openai/tl_flutter_openai.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

final backgroundColor = Colors.grey[800];
final cardBackgroundColor = Colors.grey[700];
final inputColor = Colors.grey[800];
final textColorSecondary = Colors.white38;
final textColorPrimary = Colors.white;
final accentColor = Colors.blue;

class ChatCompletionScreen extends StatefulWidget {
  const ChatCompletionScreen({super.key});

  @override
  State<ChatCompletionScreen> createState() => _ChatCompletionScreenState();
}

class _ChatCompletionScreenState extends State<ChatCompletionScreen> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();
  final _focusNode = FocusNode();
  var _hasText = false;
  var _otherUserId = '';
  var _threadId = '';
  bool _showScrollToBottomButton = false;
  var _messages = <Message>[];
  var _sending = false;
  final _openAI = OpenAI(
    apiKey: dotenv.env['OPENAI_API_KEY'] ?? '',
    organizationId: dotenv.env['OPENAI_ORGANIZATION_ID'],
    projectId: dotenv.env['OPENAI_PROJECT_ID'],
  );
  var _multilineMessageEntered = false;

  @override
  void initState() {
    _messageController.addListener(() {
      final hasText = _messageController.text.isNotEmpty;
      if (hasText != _hasText) {
        setState(() => _hasText = hasText);
      }

      final multilineMessageEntered = _messageController.text.contains('\n');
      if (multilineMessageEntered != _multilineMessageEntered) {
        setState(() => _multilineMessageEntered = multilineMessageEntered);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          'Chat completion example',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _messagesList(),
            ),
            _messageInput(context),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  //
  Widget _messagesList() {
    if (_messages.isEmpty) {
      return Center(
        child: SizedBox(
          width: 240,
          child: Text(
            'This is an example of how chat completion works. Type a message and press send to get a response.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColorSecondary,
            ),
          ),
        ),
      );
    }

    return Stack(
      children: [
        ListView.separated(
          reverse: true,
          controller: _scrollController,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          itemCount: _messages.length,
          separatorBuilder: (c, i) => const SizedBox(height: 8),
          itemBuilder: (c, i) => _messageItem(_messages[i]),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: AnimatedOpacity(
            opacity: _showScrollToBottomButton ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: _showScrollToBottomButton
                ? Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _scrollToBottom,
                      child: Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_downward,
                          size: 16,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }

  Widget _messageItem(Message message) {
    final text = message.content ?? '';
    final isShort = text.length < 30 && !text.contains('\n');
    final isSender = message.role == 'user';
    final isEmpty = text.isEmpty;

    if (isEmpty) {
      return Container();
    }

    return Row(
      children: [
        if (isSender)
          isShort
              ? const Spacer()
              : const SizedBox(
                  width: 50,
                ),
        if (isShort)
          _messageBody(message, isSender, isShort)
        else
          Expanded(
            child: _messageBody(message, isSender, isShort),
          ),
        if (!isSender)
          isShort
              ? const Spacer()
              : const SizedBox(
                  width: 50,
                ),
      ],
    );
  }

  Widget _messageBody(
    Message message,
    bool isSender,
    bool isShort,
  ) {
    final text = message.content ?? '';
    if (text.isEmpty) {
      return Container();
    }

    // todo move 31 to the const and explain this
    final linesCount = text.length / 31;
    final lastLineIsFull = (linesCount - linesCount.floor()) > 0.7;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: isSender ? Colors.blue.withAlpha(150) : inputColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: isShort
          ? Row(
              children: [
                GptMarkdown(
                  text,
                  style: TextStyle(
                    color: isSender ? textColorPrimary : textColorPrimary,
                  ),
                ),
              ],
            )
          : Stack(
              children: [
                Padding(
                  padding: lastLineIsFull
                      ? EdgeInsets.only(
                          bottom: 16,
                        )
                      : EdgeInsets.all(0),
                  child: GptMarkdown(
                    text,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1000,
                    style: TextStyle(
                      color: isSender ? textColorPrimary : textColorPrimary,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _emptyChat(String chatName) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('Chat is empty'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _messageInput(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: inputColor,
                    borderRadius: BorderRadius.circular(
                      _multilineMessageEntered ? 20 : 40,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          focusNode: _focusNode,
                          cursorColor: textColorPrimary,
                          style: TextStyle(
                            color: textColorPrimary,
                            fontSize: 14,
                          ),
                          minLines: 1,
                          maxLines: 6,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: 'Aa',
                            hintStyle: TextStyle(
                              color: textColorSecondary,
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 16.0,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      inputColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_upward,
                    color: _hasText ? Colors.white : Colors.white38,
                    size: 20,
                  ),
                  onPressed: _hasText ? _onSendPressed : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future _onSendPressed() async {
    print('_onSendPressed');
    final text = _messageController.text;
    if (text.isEmpty) {
      print('_onSendPressed - return');
      return;
    }

    try {
      setState(() => _sending = true);

      final message = UserMessage(
        name: 'Airon',
        content: text,
      );

      setState(() => _messages = [message, ..._messages]);
      _messageController.clear();
      _scrollToBottom();

      // todo change to chatCompletion
      // await _chatCubit.sendMessage(_threadId, text);
      final response = await _openAI.createChatCompletion(ChatCompletionRequest(
        messages: [message],
        model: AIModel.chatgpt4oLatest,
      ));

      print('_onSendPressed - response: ${response.toJson()}');
      final responseMessage = response.choices?.first.message;

      if (responseMessage == null) {
        showError(context, 'Response message is null');
        return;
      }

      setState(() => _messages = [responseMessage, ..._messages]);
    } catch (e, stack) {
      print('_onSendPressed - ${e}, ${stack}');
      showError(context, e.toString());
    } finally {
      setState(() => _sending = false);
    }
  }

  void _onScroll() {
    if (_scrollController.offset < 200 && _showScrollToBottomButton) {
      setState(() => _showScrollToBottomButton = false);
    }

    if (_scrollController.offset > 200 && !_showScrollToBottomButton) {
      setState(() => _showScrollToBottomButton = true);
    }
  }

  void _onTextChanged() {
    setState(() => _hasText = _messageController.text.isNotEmpty);
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    });
  }
}

//

void showError(BuildContext context, String? error) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    content: Text(
      error ?? 'Null',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      maxLines: 10,
    ),
    backgroundColor: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ));
}

void showSuccess(BuildContext context, String? message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    content: Text(
      message ?? 'Null',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      maxLines: 10,
    ),
    backgroundColor: Colors.green,
    duration: const Duration(seconds: 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ));
}

void showInfo(BuildContext context, String? message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      message ?? 'Null',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    backgroundColor: Colors.blue[700],
    duration: const Duration(seconds: 1),
  ));
}

Future<T?> showBottomModal<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? background,
}) async {
  return showModalBottomSheet<T>(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
    builder: (c) {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        child: ColoredBox(
          color: backgroundColor ?? Colors.grey,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(c).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 12,
                  ),
                  child: Container(
                    height: 5,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                builder(c)
              ],
            ),
          ),
        ),
      );
    },
  );
}
