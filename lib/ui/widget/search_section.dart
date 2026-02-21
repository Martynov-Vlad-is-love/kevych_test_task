import 'package:flutter/material.dart';
import 'package:kevych_test_task/ui/widget/search_field.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SearchField(
        onChanged: (value) {},
      ),
    );
  }
}