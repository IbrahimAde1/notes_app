import 'package:flutter/material.dart';

import '../widgets/custom_sheet_note.dart';
import '../widgets/list_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Notes', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: FloatingActionButton(
              mini: true,
              backgroundColor: const Color.fromARGB(19, 255, 255, 255),
              onPressed: () {},
              child: const Icon(
                Icons.search,
              ),
            ),
          )
        ],
      ),
      body: const ListItems(),
      floatingActionButton: FloatingActionButton(
        heroTag: HeroFlightShuttleBuilder,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: ((context) {
                return const SheetNote();
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
