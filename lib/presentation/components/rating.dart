import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.star_rounded,
                color: Colors.orange,
              ),
              const Icon(
                Icons.star_rounded,
                color: Colors.orange,
              ),
              const Icon(
                Icons.star_rounded,
                color: Colors.orange,
              ),
              Icon(
                Icons.star_border_rounded,
                color: Colors.white.withOpacity(0.3),
              ),
              Icon(
                Icons.star_border_rounded,
                color: Colors.white.withOpacity(0.3),
              ),
            ],
          ),
          const Text(
            "0 отзывов",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
