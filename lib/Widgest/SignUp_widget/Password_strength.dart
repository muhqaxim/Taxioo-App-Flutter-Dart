import 'package:flutter/material.dart';

class PasswordStrengthChecker extends StatefulWidget {
  final String password;

  const PasswordStrengthChecker({Key? key, required this.password})
      : super(key: key);

  @override
  _PasswordStrengthCheckerState createState() =>
      _PasswordStrengthCheckerState();
}

class _PasswordStrengthCheckerState extends State<PasswordStrengthChecker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _calculatePasswordStrength(widget.password),
          style: TextStyle(
            color: _calculatePasswordStrengthColor(widget.password),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        PasswordStrengthIndicator(
          strength: _calculatePasswordStrengthLevel(widget.password),
        ),
      ],
    );
  }

  String _calculatePasswordStrength(String password) {
    // Implement your logic to calculate password strength here
    // For simplicity, let's assume a basic logic where the strength is based on the length of the password
    if (password.isEmpty) {
      return 'Weak';
    } else if (password.length <= 4) {
      return 'Weak';
    } else if (password.length <= 6) {
      return 'Moderate';
    } else {
      return 'Strong';
    }
  }

  int _calculatePasswordStrengthLevel(String password) {
    // Implement your logic to calculate password strength level here
    // For simplicity, let's use the length of the password
    if (password.isEmpty) {
      return 0;
    } else if (password.length <= 6) {
      return 1;
    } else if (password.length <= 10) {
      return 2;
    } else {
      return 3;
    }
  }

  Color _calculatePasswordStrengthColor(String password) {
    // Implement your logic to determine color based on password strength
    // For simplicity, let's use red for weak, yellow for moderate, and green for strong
    switch (_calculatePasswordStrengthLevel(password)) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.green;
      default:
        return Colors.black; // Default color
    }
  }
}

class PasswordStrengthIndicator extends StatelessWidget {
  final int strength; // Strength of the password (0-4)

  PasswordStrengthIndicator({required this.strength});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(4, (index) {
        Color color = index < strength ? Colors.amber : Colors.grey;
        return Expanded(
          child: Container(
            height: 5, // Adjust the height of the dashes as needed
            color: color,
            margin: EdgeInsets.symmetric(horizontal: 2),
          ),
        );
      }),
    );
  }
}
