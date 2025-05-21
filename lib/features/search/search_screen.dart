import 'package:flutter/material.dart';
import '../../../ui/widgets/primary_text.dart';
import '../../../ui/widgets/primary_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const PrimaryText(text: 'Search', size: 20, weight: FontWeight.bold)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            PrimaryTextField(
              controller: searchController,
              hint: 'Cari sesuatu...',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = searchController.text.trim();
                });
              },
              child: const Text('Search'),
            ),
            const SizedBox(height: 24),
            if (result.isNotEmpty)
              PrimaryText(text: 'Hasil: $result', size: 16, weight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}
