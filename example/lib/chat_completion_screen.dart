import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final backgroundColor = Colors.grey[800];
final cardBackgroundColor = Colors.grey[700];
final primaryColor = Colors.white;
final inputColor = Colors.grey[800];
final textColorSecondary = Colors.white54;
final accentColor = Colors.blue;

class Message {
  final bool isMine;
  final String text;

  Message({
    required this.isMine,
    required this.text,
  });
}

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
        child: Text('Send your first message'),
      );
    }

    return Stack(
      children: [
        ListView.separated(
          reverse: true,
          controller: _scrollController,
          padding: EdgeInsets.all(8),
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
    final text = message.text ?? '';
    final isShort = text.length < 30 && !text.contains('\n');
    final isSender = message.isMine;
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
                  width: 100,
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
                  width: 100,
                ),
      ],
    );
  }

  Widget _messageBody(
    Message message,
    bool isSender,
    bool isShort,
  ) {
    final text = message.text ?? '';
    if (text.isEmpty) {
      return Container();
    }

    // todo move 31 to the const and explain this
    final linesCount = text.length / 31;
    final lastLineIsFull = (linesCount - linesCount.floor()) > 0.7;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSender ? primaryColor : cardBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: isShort
          ? Row(
              children: [
                Text(text),
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
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
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
                Text("Chat is empty"),
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
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: inputColor,
                    borderRadius: BorderRadius.circular(
                      _messageController.text.contains('\n') ? 20 : 40,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          focusNode: _focusNode,
                          cursorColor: primaryColor,
                          style: TextStyle(
                            color: primaryColor,
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
                              vertical: 5.0,
                              horizontal: 10.0,
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
                    color: Colors.white,
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
    final text = _messageController.text;
    if (text.isEmpty) {
      return;
    }

    try {
      setState(() => _sending = true);
      _messageController.clear();
      _scrollToBottom();

      // todo change to chatCompletion
      // await _chatCubit.sendMessage(_threadId, text);
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
