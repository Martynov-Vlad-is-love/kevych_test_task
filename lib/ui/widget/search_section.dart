import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kevych_test_task/ui/controller/weather_controller.dart';
import 'package:kevych_test_task/ui/widget/search_field.dart';
import 'package:provider/provider.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    final weatherController = context.read<WeatherController>();
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      weatherController.getWeatherByName(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SearchField(onChanged: _onSearchChanged),
    );
  }
}
