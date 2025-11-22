// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_markdown/flutter_markdown.dart';

class RozzoMarkdownViewer extends StatelessWidget {
  final String content;
  final double? width;
  final double? height; // ✅ Accepts optional external height

  const RozzoMarkdownViewer({
    Key? key,
    required this.content,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return Container(
      width: width ?? double.infinity,
      constraints: BoxConstraints(
        minHeight: height ?? 0, // ✅ External height as minimum only
      ),
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E232E), // Dark neutral bubble
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: MarkdownBody(
        data: content.isNotEmpty ? content : "*No content available*",
        selectable: true,
        softLineBreak: true,

        // ✅ Markdown text style configuration
        styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
          p: theme.bodyMedium.copyWith(
            fontSize: 16.0,
            height: 1.65, // ⬆️ Better vertical readability
            letterSpacing: 0.25,
            color: Colors.white.withOpacity(0.9),
          ),

          h1: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF89E219), // 🌿 Avya Green
            height: 1.4,
          ),

          h2: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1CB0F6), // 💎 Mira Blue
            height: 1.4,
          ),

          strong: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xFF2196F3), // 💙 Blue for bold terms
          ),

          blockquote: TextStyle(
            color: Colors.white.withOpacity(0.85),
            fontStyle: FontStyle.italic,
            backgroundColor: Colors.white.withOpacity(0.05),
            fontSize: 15.5,
            height: 1.5,
            letterSpacing: 0.2,
            decoration: TextDecoration.none,
          ),

          code: const TextStyle(
            backgroundColor: Color(0xFF2D2D2D),
            fontFamily: 'monospace',
            fontSize: 14.0,
            color: Color(0xFF5BE7A9), // Minty green
          ),

          listBullet: const TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            height: 1.6,
          ),

          horizontalRuleDecoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFF444444),
                width: 0.8,
              ),
            ),
          ),

          blockSpacing: 12.0, // Spacing between paragraphs
        ),
      ),
    );
  }
}
