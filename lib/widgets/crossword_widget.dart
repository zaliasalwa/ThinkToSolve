
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import '../model.dart';
import '../providers.dart';

class CrosswordWidget extends ConsumerWidget {
  const CrosswordWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = ref.watch(sizeProvider);
    return TableView.builder(
      diagonalDragBehavior: DiagonalDragBehavior.free,
      cellBuilder: _buildCell,
      columnCount: size.width,
      columnBuilder: (index) => _buildSpan(context, index),
      rowCount: size.height,
      rowBuilder: (index) => _buildSpan(context, index),
    );
  }

  TableViewCell _buildCell(BuildContext context, TableVicinity vicinity) {
    final location = Location.at(vicinity.column, vicinity.row);

    return TableViewCell(
      child: Consumer(
        builder: (context, ref, _) {
          final character = ref.watch(
            workQueueProvider.select(
              (workQueueAsync) => workQueueAsync.when(
                data: (workQueue) => workQueue.crossword.characters[location],
                error: (error, stackTrace) => null,
                loading: () => null,
              ),
            ),
          );

          final explorationCell = ref.watch(
            workQueueProvider.select(
              (workQueueAsync) => workQueueAsync.when(
                data: (workQueue) =>
                    workQueue.locationsToTry.keys.contains(location),
                error: (error, stackTrace) => false,
                loading: () => false,
              ),
            ),
          );

          if (character != null) {
            return AnimatedContainer(
              duration: Durations.extralong1,
              curve: Curves.easeInOut,
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: explorationCell ? Colors.red.shade200 : Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: AnimatedDefaultTextStyle(
                  duration: Durations.extralong1,
                  curve: Curves.easeInOut,
                  style: TextStyle(
                    fontSize: 24,
                    color: explorationCell ? Colors.white : Colors.black,
                  ),
                  child: Text(character.character.toUpperCase()),
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  TableSpan _buildSpan(BuildContext context, int index) {
    return const TableSpan(
      extent: FixedTableSpanExtent(50),
    );
  }
}
