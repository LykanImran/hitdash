import 'package:dashhit/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SessionGauge extends StatelessWidget {
  const SessionGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Session Duration',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: Consumer<DataProvider>(
                builder: (context, data, child) {
                  return SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 360,
                        ranges: <GaugeRange>[
                          GaugeRange(
                              startValue: 0, endValue: 120, color: Colors.red),
                          GaugeRange(
                              startValue: 120,
                              endValue: 240,
                              color: Colors.orange),
                          GaugeRange(
                              startValue: 240,
                              endValue: 360,
                              color: Colors.green),
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(
                            value: data.avgSessionDuration.toDouble(),
                            enableAnimation: true,
                          ),
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            widget: Text(
                              '${data.avgSessionDuration} sec',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            angle: 90,
                            positionFactor: 0.5,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
