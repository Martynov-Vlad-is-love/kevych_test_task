import 'dart:ui';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String hint;

  const SearchField({
    super.key,
    this.onChanged,
    this.hint = "Input city...",
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField>
    with SingleTickerProviderStateMixin {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  late AnimationController anim;

  @override
  void initState() {
    super.initState();

    anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        anim.forward();
      } else {
        anim.reverse();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    anim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: anim,
      builder: (_, _) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 15,
              sigmaY: 15,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha:0.08 + anim.value * 0.07),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withValues(alpha:0.25 + anim.value * 0.4),
                  width: 1.3,
                ),
              ),
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hint,
                  hintStyle:
                  TextStyle(color: Colors.white.withValues(alpha:0.7)),
                  prefixIcon: Icon(Icons.search,
                      color: Colors.white.withValues(alpha:0.9)),
                  suffixIcon: controller.text.isEmpty
                      ? null
                      : IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      controller.clear();
                      widget.onChanged?.call("");
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}