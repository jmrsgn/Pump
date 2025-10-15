import 'package:flutter/material.dart';
import 'package:pump/core/constants/strings.dart';
import 'package:pump/core/theme/app_colors.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';
import 'package:pump/features/user/domain/message.dart';

import '../../../../core/constants/dimens.dart';

class _LocalColors {
  static const primary = Color(0xFFEC7216);
  static const background = Color(0xFF0E0E10);
  static const incomingBubble = Color(0xFF1F1F23);
  static const outgoingBubble = Color(0xFFEC7216);
  static const textOnPrimary = Colors.white;
  static const muted = Colors.white70;
}

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
            const SizedBox(width: 8),
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
                  'Online',
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        actions: [
          // IconButton(icon: const Icon(Icons.search), onPressed: () {}),
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

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;
    final radius = BorderRadius.only(
      topLeft: const Radius.circular(12),
      topRight: const Radius.circular(12),
      bottomLeft: Radius.circular(isMe ? 12 : 0),
      bottomRight: Radius.circular(isMe ? 0 : 12),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isMe) const SizedBox(width: 8),
        if (!isMe)
          const CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/images/jm.jpg"),
          ),
        if (!isMe) const SizedBox(width: 8),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration: BoxDecoration(
              color: isMe
                  ? _LocalColors.outgoingBubble
                  : _LocalColors.incomingBubble,
              borderRadius: radius,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.text,
                  style: TextStyle(
                    color: isMe ? _LocalColors.textOnPrimary : Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _formatTime(message.time),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white70,
                      ),
                    ),
                    if (isMe) const SizedBox(width: 6),
                    if (isMe)
                      const Icon(Icons.check, size: 12, color: Colors.white70),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (isMe) const SizedBox(width: 8),
      ],
    );
  }

  static String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);
    if (diff.inMinutes < 1) return 'now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    return '${time.day}/${time.month}/${time.year}';
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
            const SizedBox(width: 8),
            InkWell(
              onTap: _canSend
                  ? () => widget.onSend(widget.controller.text)
                  : null,
              borderRadius: BorderRadius.circular(24),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _canSend ? _LocalColors.primary : Colors.white12,
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
