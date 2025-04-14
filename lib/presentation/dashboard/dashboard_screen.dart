import 'package:dashhit/common/widgets/metric_card.dart';
import 'package:dashhit/common/widgets/page_view_chart.dart';
import 'package:dashhit/common/widgets/session_gauge.dart';
import 'package:dashhit/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HitDash'),
        actions: [
          IconButton(
            icon: const Icon(Icons.swap_horiz),
            onPressed: () {
              Provider.of<DataProvider>(context, listen: false)
                  .toggleConnectionMethod();
            },
            tooltip:
                'Switch to ${Provider.of<DataProvider>(context, listen: false).useWebSocket ? 'Polling' : 'WebSocket'}',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          children: [
            // Metrics Row
            Row(
              children: [
                MetricCard(
                  title: 'Active Users',
                  value:
                      Provider.of<DataProvider>(context).activeUsers.toString(),
                  icon: Icons.people,
                  color: Colors.blue,
                ),
                MetricCard(
                  title: 'Page Views',
                  value:
                      Provider.of<DataProvider>(context).pageViews.toString(),
                  icon: Icons.remove_red_eye,
                  color: Colors.green,
                ),
              ],
            ),
            // Charts Row
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: PageViewChart(),
                ),
                Expanded(
                  flex: 1,
                  child: SessionGauge(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Using ${Provider.of<DataProvider>(context).useWebSocket ? 'WebSocket' : 'HTTP Polling'}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
