import 'package:flutter/material.dart';
import 'package:pump/core/constants/app/app_dimens.dart';
import 'package:pump/core/constants/app/app_strings.dart';
import '../../../../core/utils/ui_utils.dart';
import '../theme/app_colors.dart';

class AppTextInput extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onAttach;
  final FocusNode? focusNode;

  const AppTextInput({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onAttach,
    this.focusNode,
  });

  @override
  State<AppTextInput> createState() => _AppTextInputState();
}

class _AppTextInputState extends State<AppTextInput> {
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
    return Container(
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
              focusNode: widget.focusNode,
              controller: widget.controller,
              maxLines: 5,
              minLines: 1,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white12,
                hintText: AppStrings.typeAMessage,
                hintStyle: const TextStyle(color: Colors.white54),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(AppDimens.dimen24),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              style: const TextStyle(color: Colors.white),
              onSubmitted: (v) {
                if (v.trim().isNotEmpty) widget.onSend();
              },
            ),
          ),
          UiUtils.addHorizontalSpaceS(),
          InkWell(
            onTap: _canSend ? () => widget.onSend() : null,
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
    );
  }
}
