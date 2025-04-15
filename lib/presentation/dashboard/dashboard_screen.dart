import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dashhit/common/constants/enums.dart';
import 'package:dashhit/common/constants/image_constants.dart';
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
        backgroundColor: Colors.transparent,
        title: const Text('HitDash'),
        actions: [
          Consumer<DataProvider>(builder: (context, data, child) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: AnimatedToggleSwitch<SwitchType>.dual(
                current: data.currentSwitch,
                first: SwitchType.socket,
                second: SwitchType.polling,
                spacing: 50.0,
                style: const ToggleStyle(
                  borderColor: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
                borderWidth: 5.0,
                height: 50,
                onChanged: (value) {
                  Provider.of<DataProvider>(context, listen: false)
                      .toggleConnectionMethod(context);
                },
                styleBuilder: (v) => ToggleStyle(
                    indicatorColor:
                        v == SwitchType.socket ? Colors.blue : Colors.green),
                iconBuilder: (value) => value == SwitchType.socket
                    ? const Icon(Icons.webhook)
                    : const Icon(Icons.bolt),
                textBuilder: (value) => value == SwitchType.socket
                    ? const Center(child: Text('Web Socket'))
                    : const Center(child: Text('Polling')),
              ),
            );
          }),
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
                  image: ImageConstants.user,
                  color: Colors.blue,
                ),
                MetricCard(
                  title: 'Page Views',
                  value:
                      Provider.of<DataProvider>(context).pageViews.toString(),
                  image: ImageConstants.eyeVisibility,
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
