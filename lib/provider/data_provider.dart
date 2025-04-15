import 'dart:convert';

import 'package:dashhit/common/constants/enums.dart';
import 'package:dashhit/common/widgets/flush.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';

class DataProvider with ChangeNotifier {
  int _activeUsers = 0;
  int _pageViews = 0;
  int _avgSessionDuration = 0;
  List<int> _pageViewHistory = List.generate(10, (index) => 0);
  bool _useWebSocket = true;
  late WebSocketChannel _channel;
  SwitchType currentSwitch = SwitchType.socket;

  DataProvider() {
    if (_useWebSocket) {
      _initWebSocket();
    } else {
      _startPolling();
    }
  }

  int get activeUsers => _activeUsers;
  int get pageViews => _pageViews;
  int get avgSessionDuration => _avgSessionDuration;
  List<int> get pageViewHistory => _pageViewHistory;
  bool get useWebSocket => _useWebSocket;

  void _initWebSocket() {
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://localhost:8080'),
    );

    _channel.stream.listen((data) {
      _updateData(json.decode(data));
    });
    currentSwitch = SwitchType.socket;
  }

  void _startPolling() {
    Future.delayed(Duration.zero, () async {
      while (true) {
        await Future.delayed(const Duration(seconds: 2));
        await _fetchData();
      }
    });
    currentSwitch = SwitchType.polling;
  }

  Future<void> _fetchData() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/api/metrics'));
    if (response.statusCode == 200) {
      _updateData(json.decode(response.body));
    }
  }

  void _updateData(Map<String, dynamic> data) {
    _activeUsers = data['activeUsers'];
    _pageViews = data['pageViews'];
    _avgSessionDuration = data['avgSessionDuration'];

    _pageViewHistory = [..._pageViewHistory.sublist(1), _pageViews];

    notifyListeners();
  }

  void toggleConnectionMethod(BuildContext context) {
    _useWebSocket = !_useWebSocket;
    if (_useWebSocket) {
      _initWebSocket();
      Flush(
        title: "Web Socket",
        message: "Web Socket connected successfully!",
      ).build(context);
    } else {
      _channel.sink.close();
      _startPolling();
      Flush(
        title: "Polling",
        message: "Polling service connected successfully!",
      ).build(context);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    if (_useWebSocket) {
      _channel.sink.close();
    }
    super.dispose();
  }
}
