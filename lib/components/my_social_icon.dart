import 'package:flutter/material.dart';

class MySocialIcon extends StatelessWidget {
  final IconData icon; 
  final Color color; 
  final void Function()? onTap; 

  const MySocialIcon({
    super.key,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[300]!, width: 1.5),
        ),
        child: Icon(icon, color: color, size: 30),
      ),
    );
  }
}
