import 'package:dashhit/common/widgets/base_card.dart';
import 'package:dashhit/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String image; 
  final Color color;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.image, 
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BaseCard(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  width: 24,
                  height: 24,
                  color: color,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Consumer<DataProvider>(
              builder: (context, data, child) {
                return Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
