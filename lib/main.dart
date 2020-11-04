import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import "package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart";
import 'package:baseconvert/baseconvert.dart';
import './navigationDrawer.dart';
import "./components/account.dart";
import './routes/pageRoutes.dart';
import './components/homepage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePAge(),
      routes: {
        pageRoutes.account : (context)=> ConnectAccount(),
        pageRoutes.homepage : (context)=> HomePAge()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: NavigationDrawer(),
      body: HomePAge(),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       children: [
      //         IconButton(
      //             onPressed: () => {},
      //             iconSize: 80.0,
      //             icon: Icon(
      //               Icons.computer,
      //               size: 50,
      //               semanticLabel: 'Text to announce in accessibility modes',
      //             )),
      //         IconButton(
      //           onPressed: () => {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => LivingRoom()),
      //             )
      //           },
      //           iconSize: 80.0,
      //           icon: Icon(
      //             Icons.desktop_mac,
      //             size: 50,
      //           ),
      //         ),
      //       ],
      //     )
      //   ],
      // ),
      floatingActionButton:
          FloatingActionButton(onPressed: () => {}, child: Icon(Icons.add)),
    );
  }
}

class LivingRoom extends StatefulWidget {
  LivingRoom({Key key}) : super(key: key);

  @override
  _LivingRoom createState() => _LivingRoom();
}

class _LivingRoom extends State<LivingRoom> {
  double _currentSliderValue = 0;
  bool state = false;
  final List<Color> hueColors = [
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 0, 255, 0),
    const Color.fromARGB(255, 0, 255, 255),
    const Color.fromARGB(255, 0, 0, 255),
  ];

  final List<Color> colors1 = [
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 255, 255, 0),
    const Color.fromARGB(255, 0, 255, 0),
    const Color.fromARGB(255, 0, 255, 255),
    const Color.fromARGB(255, 0, 0, 255),
    const Color.fromARGB(255, 255, 0, 255)
  ];
  double value = 0.0;
  Color c = Color.fromRGBO(255, 0, 0, 1);
  void onChanged(double value) => this.value = value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Living Room"),
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text('BPL Light'),
                      subtitle: Text('Living Room'),
                      trailing: Switch(
                          value: state,
                          onChanged: (bool s) => {
                                setState(() => {state = s})
                              }),
                    ),
                    Icon(
                      Icons.lightbulb_outline,
                      color: this.c,
                      size: 80.0,
                    ),
                    Container(
                      height: 5,
                      width: 300.0,
                      margin: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
                      padding: EdgeInsets.symmetric(horizontal: 0.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(colors: <Color>[
                            Colors.red,
                            Colors.green,
                            Colors.blue
                          ])),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.transparent,
                          inactiveTrackColor: Colors.transparent,
                          trackHeight: 5.0,
                          thumbColor: Colors.yellow,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 8.0),
                          overlayColor: Colors.transparent,
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 14.0),
                        ),
                        child: Slider(
                          value: _currentSliderValue,
                          min: 0,
                          max: 100,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() => {_currentSliderValue = value});
                            if (this._currentSliderValue <= 25) {
                              setState(() => {
                                    if (this._currentSliderValue != 0 &&
                                        c != Color.fromRGBO(255, 0, 0, 1))
                                      {
                                        c = Color.fromRGBO(
                                            255,
                                            ((255 * this._currentSliderValue) ~/
                                                    20.0)
                                                .toInt(),
                                            0,
                                            1),
                                      }
                                  });
                            } else if (this._currentSliderValue <= 50) {
                              setState(() => {
                                    c = Color.fromRGBO(
                                        ((255 *
                                                    (50 -
                                                        (this._currentSliderValue)
                                                            .toInt())) ~/
                                                20.0)
                                            .toInt(),
                                        255,
                                        0,
                                        1)
                                  });
                            } else if (this._currentSliderValue <= 75) {
                              setState(() => {
                                    c = Color.fromRGBO(
                                        0,
                                        255,
                                        ((255 *
                                                    ((this._currentSliderValue)
                                                            .toInt() -
                                                        50)) ~/
                                                20.0)
                                            .toInt(),
                                        1)
                                  });
                            } else {
                              setState(() => {
                                    c = Color.fromRGBO(
                                        0,
                                        ((255 *
                                                    (100 -
                                                        (this._currentSliderValue)
                                                            .toInt())) ~/
                                                20)
                                            .toInt(),
                                        255,
                                        1)
                                  });
                            }
                          },
                        ),
                      ),
                    ),
                    new Text(
                      this._currentSliderValue.toString(),
                      style: Theme.of(context).textTheme.display1,
                    ),
                    // new SliderPicker(
                    //     min: 0.0,
                    //     max: 100.0,
                    //     value: this.value,
                    //     onChanged: (value) => {
                    //           super.setState(() => this.onChanged(value)),
                    //           if (this.value * 100 <= 25) {
                    //             setState(()=>{
                    //               c=Color.fromRGBO(255, ((255*this.value)~/20.0).toInt(),0, 1)
                    //             })
                    //           }
                    //           else if(this.value<=50){
                    //             setState(()=>{
                    //               c=Color.fromRGBO(((255*(50-(this.value).toInt()))~/20.0).toInt(),255 ,0, 1)
                    //             })
                    //           }
                    //           else if(this.value<=75){
                    //             setState(()=>{
                    //               c=Color.fromRGBO(0,255 ,((255*((this.value).toInt()-50))~/20.0).toInt(), 1)
                    //             })
                    //           }
                    //           else{
                    //             setState(()=>{
                    //               c=Color.fromRGBO(0, ((255*(100-(this.value).toInt()))~/20).toInt(),255, 1)
                    //             })
                    //           }
                    //         },
                    //     child: new DecoratedBox(
                    //         decoration: new BoxDecoration(
                    //             gradient: new LinearGradient(
                    //                 colors: this.hueColors))))
                  ],
                ),
              );
            }));
  }
}

// }

class GradientRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  /// Create a slider track that draws two rectangles with rounded outer edges.
  const GradientRectSliderTrackShape();

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    @required RenderBox parentBox,
    @required SliderThemeData sliderTheme,
    @required Animation<double> enableAnimation,
    @required TextDirection textDirection,
    @required Offset thumbCenter,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    assert(context != null);
    assert(offset != null);
    assert(parentBox != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    assert(enableAnimation != null);
    assert(textDirection != null);
    assert(thumbCenter != null);
    // If the slider [SliderThemeData.trackHeight] is less than or equal to 0,
    // then it makes no difference whether the track is painted or not,
    // therefore the painting  can be a no-op.
    if (sliderTheme.trackHeight <= 0) {
      return;
    }

    LinearGradient gradient =
        LinearGradient(colors: <Color>[Colors.red, Colors.blue, Colors.green]);

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    // Assign the track segment paints, which are leading: active and
    // trailing: inactive.
    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(
        begin: sliderTheme.disabledInactiveTrackColor,
        end: sliderTheme.inactiveTrackColor);
    final Paint activePaint = Paint()
      ..shader = gradient.createShader(trackRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation);
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation);
    Paint leftTrackPaint;
    Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final Radius activeTrackRadius = Radius.circular(trackRect.height / 2 + 1);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        (textDirection == TextDirection.ltr)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
        bottomLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
      ),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
        bottomRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
      ),
      rightTrackPaint,
    );
  }
}
