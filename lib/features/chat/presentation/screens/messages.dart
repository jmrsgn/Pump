import 'package:flutter/material.dart';
import 'package:pump/core/utils/ui_utils.dart';
import 'package:pump/features/chat/domain/entities/message.dart';

import '../../../../core/constants/app/app_dimens.dart';
import '../../../../core/constants/app/app_strings.dart';
import '../../../../core/presentation/theme/app_colors.dart';
import '../../../../core/presentation/widgets/custom_scaffold.dart';
import '../widgets/message_bubble.dart';

class MessagesScreen extends StatefulWidget {
  final String titleName;
  final List<Message>? initialMessages;

  const MessagesScreen({
    super.key,
    required this.titleName,
    this.initialMessages,
  });

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  late List<Message> _messages;

  @override
  void initState() {
    super.initState();

    _messages =
        widget.initialMessages ??
        [
          Message(
            id: 'm1',
            text: 'Checkins burat',
            time: DateTime.now().subtract(const Duration(minutes: 12)),
            isMe: false,
          ),
        ];

    // ensure we start scrolled to bottom after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    final message = Message(
      id: 'm${_messages.length + 1}',
      text: text.trim(),
      time: DateTime.now(),
      isMe: true,
    );

    setState(() {
      _messages.add(message);
    });

    _textController.clear();
    // allow UI to update, then scroll:
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollToBottom(animated: true),
    );
  }

  void _scrollToBottom({bool animated = false}) {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position.maxScrollExtent;
    if (animated) {
      _scrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      _scrollController.jumpTo(position);
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Row(
          children: [
            UiUtils.addHorizontalSpaceS(),
            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage("assets/images/jm.jpg"),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.titleName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  AppStrings.active,
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen8),
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _messages.length,
                padding: EdgeInsets.symmetric(vertical: AppDimens.dimen12),
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  final isMe = msg.isMe;

                  return Padding(
                    padding: EdgeInsets.only(
                      top: 6,
                      bottom: 6,
                      left: isMe ? 64 : 8,
                      right: isMe ? 8 : 64,
                    ),
                    child: MessageBubble(message: msg),
                  );
                },
              ),
            ),
          ),
          // input area
          _MessageInput(
            controller: _textController,
            onSend: _sendMessage,
            onAttach: () {
              // implement attachment (image picker, camera, etc.)
            },
          ),
        ],
      ),
    );
  }
}

class _MessageInput extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSend;
  final VoidCallback onAttach;

  const _MessageInput({
    required this.controller,
    required this.onSend,
    required this.onAttach,
  });

  @override
  State<_MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<_MessageInput> {
  bool _canSend = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final hasText = widget.controller.text.trim().isNotEmpty;
    if (hasText != _canSend) setState(() => _canSend = hasText);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        color: Colors.black26,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            IconButton(
              onPressed: widget.onAttach,
              icon: const Icon(Icons.attach_file, color: Colors.white70),
            ),
            Expanded(
              child: TextField(
                controller: widget.controller,
                maxLines: 5,
                minLines: 1,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white12,
                  hintText: 'Type a message',
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                onSubmitted: (v) {
                  if (v.trim().isNotEmpty) {
                    widget.onSend(v);
                  }
                },
              ),
            ),
            UiUtils.addHorizontalSpaceS(),
            InkWell(
              onTap: _canSend
                  ? () => widget.onSend(widget.controller.text)
                  : null,
              borderRadius: BorderRadius.circular(24),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _canSend ? AppColors.primary : Colors.white12,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _canSend ? Icons.send : Icons.mic,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
