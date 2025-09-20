import 'package:flutter/material.dart';
import 'package:fundamental1/model/model.dart';
class Turis extends StatelessWidget {
  const Turis({
    super.key,
    required this.tourism,
    required this.ontap
  });
  
  final Tourism tourism;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tourism.name,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              tourism.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
 