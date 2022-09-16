import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class spectrumData with ChangeNotifier{
  String spectrum_data = ' ';

  getSpectrumData(String deviceName) async {
    print('spectrum_data_getting');
    var response = await http.get(Uri.parse('http://140.113.213.57:9091/get_data_test?device=esp32-cam'));
    print('done');
    var data = json.decode(response.body);
    print(data['data']);
    spectrum_data = data['data'].toString();
    print('spectrum_data:'+spectrum_data);

    notifyListeners();
  }
}