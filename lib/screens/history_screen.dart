import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/history_provider.dart';

class HistoryScreen extends StatelessWidget {

  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final historyProvider =
    Provider.of<HistoryProvider>(
        context);

    return Scaffold(

      appBar: AppBar(

        title: const Text("History"),

        actions: [

          IconButton(

            icon: const Icon(Icons.delete),

            onPressed: () {

              historyProvider.clearHistory();

            },

          ),

        ],

      ),

      body:

      historyProvider.history.isEmpty

          ? const Center(
        child:
        Text("No History"),
      )

          : ListView.builder(

        itemCount:
        historyProvider
            .history.length,

        itemBuilder:
            (context, index) {

          final item =
          historyProvider
              .history[index];

          return ListTile(

            title: Text(
                item.expression),

            subtitle:
            Text(item.result),

          );

        },

      ),

    );

  }

}