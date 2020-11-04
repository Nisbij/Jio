import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import "package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart";
import 'package:baseconvert/baseconvert.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:ui';
import 'dart:async';
import '../routes/pageRoutes.dart';
import '../navigationDrawer.dart';

class ConnectAccount extends StatefulWidget {
  static const String routeName = '/Accounts';

  @override
  _ConnectAccountState createState() => _ConnectAccountState();
}

class _ConnectAccountState extends State<ConnectAccount> {
  String x = "";
  Stopwatch s = new Stopwatch()..start();
  void starttimer() {
    Timer(Duration(seconds: 1), keeprunning);
  }

  void keeprunning() {
    if (s.isRunning) {
      starttimer();
    }
    setState(() {
      x = s.elapsed.inMinutes.toString().padLeft(2, "0") +
          ":" +
          (s.elapsed.inSeconds % 60).toString().padLeft(2, "0");
    });
  }

  @override
  void initState() {
    super.initState();
    starttimer();
  }

  void dispose() {
    super.dispose();
    s.stop();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Account"),
        ),
        drawer: NavigationDrawer(),
        body: Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 200,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        showLabels: false,
                        showTicks: false,
                        startAngle: 270,
                        endAngle: 270,
                        axisLineStyle: AxisLineStyle(
                          thickness: 1,
                          color: const Color.fromARGB(255, 0, 169, 181),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: 50,
                            width: 0.05,
                            color: Colors.white,
                            pointerOffset: 0.1,
                            cornerStyle: CornerStyle.bothCurve,
                            sizeUnit: GaugeSizeUnit.factor,
                          )
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            
                              positionFactor: 0.5,
                              angle: 90,
                              widget: Text(
                                x,
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ))
                        ]),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Connecting to other accounts",
                    style: TextStyle(fontSize: 20))
              ],
            )));
  }
}
