import 'package:flutter/material.dart';

class CustomSnackBar {
  static SnackBar success({
    required BuildContext context,
    required String message,
  }) {
    return SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      content: _buildContent(
        context,
        icon: Icons.check_circle,
        message: message,
        backgroundColor: Colors.green,
      ),
    );
  }

  static SnackBar error({
    required BuildContext context,
    required String message,
  }) {
    return SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      content: _buildContent(
        context,
        icon: Icons.error,
        message: message,
        backgroundColor: Colors.red,
      ),
    );
  }

  static Widget _buildContent(
    BuildContext context, {
    required IconData icon,
    required String message,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Text(message, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
