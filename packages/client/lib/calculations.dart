// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:http/http.dart' as http;
import 'NavigationDrawer.dart';
import 'package:client/titlebar.dart';

class MathematicalTools extends StatefulWidget {
  const MathematicalTools({Key? key}) : super(key: key);

  @override
  _MathematicalToolsState createState() => _MathematicalToolsState();
}

const appcolour = const Color(0xFF003255);

class _MathematicalToolsState extends State<MathematicalTools> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavigationDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: const TextSpan(children: <TextSpan>[
            TextSpan(
                text: 'MATHEMATICAL',
                style: TextStyle(color: Colors.white, fontSize: 30)),
            TextSpan(
                text: ' TOOLS',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ]),
        ),
        backgroundColor: appcolour,
      ),
      body: Container(
          child: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        maxCrossAxisExtent: 200.0,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ArithmeticSequence()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Arithmetic Sequence',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AreaCircle()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Area Circle',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AreaParrallelogram()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Area Parrallelogram',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AreaRectangle()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Area Rectangle',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AreaRhombus()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Area Rhombus',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AreaSquare()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Area Square',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AreaTrapezoid()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Area Trapezoid',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AreaTriangle()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Area Triangle',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CompoundIntrest()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Compound Intrest',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConvertDR()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Convert Degrees to Radians',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConvertRD()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Convert Radians to Degrees',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    content: Text("Geometric Sequence"),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Geometric Sequence',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MeanStatistics()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Mean',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MedianStatistics()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Median',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MedianLowStatistics()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Median Low',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MedianHighStatistics()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Median High',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ModeStatistics()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Mode',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const QuadraticEquation()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Quadratic Equation',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SimultaneousEquations()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Simultaneous Equations',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SimpleIntrest()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Simple Interest',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const STDEVStatistics()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Sample Standard Deviation',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VarianceStatistics()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Sample Variance',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PSTDEVStatistics()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Population Standard Deviation',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PVarianceStatistics()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Population Variance',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PerimetreCircle()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Perimeter Circle',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PerimetreParrallelogram()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Perimeter Parrallelogram',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PerimetreRhombus()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Perimeter Rhombus',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PerimetreSquare()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Perimeter Square',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PerimetreTrapezoid()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Perimeter Trapezoid',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PerimetreTriangle()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Perimeter Triangle',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PerimetreRectangle()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Perimeter Rectangle',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ],
      )),
    );
  }
}

class SimultaneousEquations extends StatefulWidget {
  const SimultaneousEquations({Key? key}) : super(key: key);

  @override
  _SimultaneousEquationsState createState() => _SimultaneousEquationsState();
}

class _SimultaneousEquationsState extends State<SimultaneousEquations> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();

  String equation1partone = '';
  String equation1parttwo = '';
  String equation2partone = '';
  String equation2partwo = '';
  String equation1partonefinal = '';
  String equation1parttwofinal = '';
  String equation2partonefinal = '';
  String equation2partwofinal = '';
  String equation1 = '';
  String equation2 = '';
  String finalresponse = '';
  // final _formkey = GlobalKey();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController1.dispose();
    textController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Solve Simultaneous Equations.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              // No parameters are required.
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Equation 1',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onSubmitted: (value) {
                                equation1 = value;
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'Equation 2',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController2,
                          onChanged: (value) {
                            equation2 = value;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            final equations1 = equation1.split('{=}');

                            equation1partone = equations1[0];
                            equation1parttwo = equations1[1];
                            try {
                              equation1partonefinal =
                                  '${TeXParser(equation1partone).parse()}';
                              equation1parttwofinal =
                                  '${TeXParser(equation1parttwo).parse()}';
                            } catch (_) {
                              equation1 = 'invalid input';
                            }

                            final equations2 = equation2.split('{=}');
                            equation2partone = equations2[0];
                            equation2partwo = equations2[1];
                            try {
                              equation2partonefinal =
                                  '${TeXParser(equation2partone).parse()}';
                              equation2partwofinal =
                                  '${TeXParser(equation2partwo).parse()}';
                            } catch (_) {
                              equation2 = 'invalid input';
                            }

                            String finalequation;
                            if (equation1 == 'invalid input' ||
                                equation2 == 'invalid input') {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              finalequation =
                                  "$equation1partonefinal,$equation1parttwofinal:$equation2partonefinal,$equation2partwofinal";
                              finalequation =
                                  Uri.encodeComponent(finalequation);
                              final url =
                                  'http://127.0.0.1:5000/api/solvesimultaneousequation/?query=$finalequation';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Solve Equation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class AreaCircle extends StatefulWidget {
  const AreaCircle({Key? key}) : super(key: key);

  @override
  _AreaCircleState createState() => _AreaCircleState();
}

class _AreaCircleState extends State<AreaCircle> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();

  String radius = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Area Circle.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Radius',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  radius = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  radius = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            final url =
                                'http://127.0.0.1:5000/api/areacircle/?query=$radius';
                            final response = await http.get(Uri.parse(url));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(response.body),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Find Area',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class AreaParrallelogram extends StatefulWidget {
  const AreaParrallelogram({Key? key}) : super(key: key);

  @override
  _AreaParrallelogramState createState() => _AreaParrallelogramState();
}

class _AreaParrallelogramState extends State<AreaParrallelogram> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();

  String base = '';
  String height = '';

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Area Parrallelogram.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Base',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  base = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  base = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'Height',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController2,
                          onChanged: (value) {
                            try {
                              height = '${TeXParser(value).parse()}';
                            } catch (_) {
                              height = 'invalid input';
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            String finalResponse = "$base,$height";
                            final url =
                                'http://127.0.0.1:5000/api/areaparrallelogram/?query=$finalResponse';
                            final response = await http.get(Uri.parse(url));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(response.body),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Find Area',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class AreaRectangle extends StatefulWidget {
  const AreaRectangle({Key? key}) : super(key: key);

  @override
  _AreaRectangleState createState() => _AreaRectangleState();
}

class _AreaRectangleState extends State<AreaRectangle> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();

  String length = '';
  String width = '';

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Area Rectangle.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Length',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  length = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  length = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'Width',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController2,
                          onChanged: (value) {
                            try {
                              width = '${TeXParser(value).parse()}';
                            } catch (_) {
                              width = 'invalid input';
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            if (length == "invalid input" ||
                                width == "invalid input") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse = "$length,$width";
                              final url =
                                  'http://127.0.0.1:5000/api/arearectangle/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Find Area',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class AreaRhombus extends StatefulWidget {
  const AreaRhombus({Key? key}) : super(key: key);

  @override
  _AreaRhombusState createState() => _AreaRhombusState();
}

class _AreaRhombusState extends State<AreaRhombus> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();

  String diagonal1 = '';
  String diagonal2 = '';

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Area Rhombus.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Diagonal 1',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  diagonal1 = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  diagonal1 = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'Diagonal 2',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController2,
                          onChanged: (value) {
                            try {
                              diagonal2 = '${TeXParser(value).parse()}';
                            } catch (_) {
                              diagonal2 = 'invalid input';
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            if (diagonal1 == "invalid input" ||
                                diagonal2 == "invalid input") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse = "$diagonal1,$diagonal2";
                              final url =
                                  'http://127.0.0.1:5000/api/arearhombus/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Find Area',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class AreaSquare extends StatefulWidget {
  const AreaSquare({Key? key}) : super(key: key);

  @override
  _AreaSquareState createState() => _AreaSquareState();
}

class _AreaSquareState extends State<AreaSquare> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();

  String side = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Area Square.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Side',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  side = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  side = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            if (side == "invalid input") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse = side;
                              final url =
                                  'http://127.0.0.1:5000/api/areasquare/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Find Area',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class AreaTrapezoid extends StatefulWidget {
  const AreaTrapezoid({Key? key}) : super(key: key);

  @override
  _AreaTrapezoidState createState() => _AreaTrapezoidState();
}

class _AreaTrapezoidState extends State<AreaTrapezoid> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();
  final MathFieldEditingController textController3 =
      MathFieldEditingController();

  String firstbase = '';
  String secondbase = '';
  String height = '';

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Area Trapezoid.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'FirstBase',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  firstbase = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  firstbase = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'SecondBase',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController2,
                          onChanged: (value) {
                            try {
                              secondbase = '${TeXParser(value).parse()}';
                            } catch (_) {
                              secondbase = 'invalid input';
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'FirstSide',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController3,
                              onChanged: (value) {
                                try {
                                  height = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  height = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            if (firstbase == "invalid input" ||
                                secondbase == "invalid input" ||
                                height == "invalid input") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse =
                                  "$firstbase,$secondbase,$height";
                              final url =
                                  'http://127.0.0.1:5000/api/areatrapezoid/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Find Area',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class AreaTriangle extends StatefulWidget {
  const AreaTriangle({Key? key}) : super(key: key);

  @override
  _AreaTriangleState createState() => _AreaTriangleState();
}

class _AreaTriangleState extends State<AreaTriangle> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();

  String base = '';
  String height = '';

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Area Triangle.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Base',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  base = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  base = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'Height',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController2,
                          onChanged: (value) {
                            try {
                              height = '${TeXParser(value).parse()}';
                            } catch (_) {
                              height = 'invalid input';
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            if (base == "invalid input" ||
                                height == "invalid input") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse = "$base,$height";
                              final url =
                                  'http://127.0.0.1:5000/api/areatriangle/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Find Area',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class PerimetreCircle extends StatefulWidget {
  const PerimetreCircle({Key? key}) : super(key: key);

  @override
  _PerimetreCircleState createState() => _PerimetreCircleState();
}

class _PerimetreCircleState extends State<PerimetreCircle> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();

  String radius = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Perimeter Circle.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Radius',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  radius = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  radius = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            if (radius == "invalid input") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse = radius;
                              final url =
                                  'http://127.0.0.1:5000/api/perimetrecircle/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Find Perimeter',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class PerimetreParrallelogram extends StatefulWidget {
  const PerimetreParrallelogram({Key? key}) : super(key: key);

  @override
  _PerimetreParrallelogramState createState() =>
      _PerimetreParrallelogramState();
}

class _PerimetreParrallelogramState extends State<PerimetreParrallelogram> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();

  String base = '';
  String height = '';

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Perimeter Parrallelogram.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Base',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  base = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  base = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'Height',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController2,
                          onChanged: (value) {
                            try {
                              height = '${TeXParser(value).parse()}';
                            } catch (_) {
                              height = 'invalid input';
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            String finalResponse = "$base,$height";
                            final url =
                                'http://127.0.0.1:5000/api/perimetreparrallelogram/?query=$finalResponse';
                            final response = await http.get(Uri.parse(url));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(response.body),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Find Perimeter',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class PerimetreRhombus extends StatefulWidget {
  const PerimetreRhombus({Key? key}) : super(key: key);

  @override
  _PerimetreRhombusState createState() => _PerimetreRhombusState();
}

class _PerimetreRhombusState extends State<PerimetreRhombus> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();

  String side = '';

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Perimeter Rhombus.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Side',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  side = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  side = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            if (side == "invalid input") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse = side;
                              final url =
                                  'http://127.0.0.1:5000/api/perimetrerhombus/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Find Perimeter',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class PerimetreSquare extends StatefulWidget {
  const PerimetreSquare({Key? key}) : super(key: key);

  @override
  _PerimetreSquareState createState() => _PerimetreSquareState();
}

class _PerimetreSquareState extends State<PerimetreSquare> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();

  String side = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Perimeter Square.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Side',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  side = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  side = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            if (side == "invalid input") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse = side;
                              final url =
                                  'http://127.0.0.1:5000/api/perimetresquare/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Find Perimeter',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class PerimetreRectangle extends StatefulWidget {
  const PerimetreRectangle({Key? key}) : super(key: key);

  @override
  _PerimetreRectangleState createState() => _PerimetreRectangleState();
}

class _PerimetreRectangleState extends State<PerimetreRectangle> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();
  String length = '';
  String width = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Perimeter Rectangle.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Length',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  length = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  length = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'Width',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController2,
                          onChanged: (value) {
                            try {
                              width = '${TeXParser(value).parse()}';
                            } catch (_) {
                              width = 'invalid input';
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            if (length == "invalid input" ||
                                width == "invalid input") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse = "$length,$width";
                              final url =
                                  'http://127.0.0.1:5000/api/perimetrerectangle/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Find Perimeter',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class PerimetreTrapezoid extends StatefulWidget {
  const PerimetreTrapezoid({Key? key}) : super(key: key);

  @override
  _PerimetreTrapezoidState createState() => _PerimetreTrapezoidState();
}

class _PerimetreTrapezoidState extends State<PerimetreTrapezoid> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();
  final MathFieldEditingController textController3 =
      MathFieldEditingController();
  final MathFieldEditingController textController4 =
      MathFieldEditingController();
  String firstbase = '';
  String secondbase = '';
  String firstside = '';
  String secondside = '';

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    textController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Perimeter Trapezoid.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'First Base',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  firstbase = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  firstbase = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'Second Base',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController2,
                          onChanged: (value) {
                            try {
                              secondbase = '${TeXParser(value).parse()}';
                            } catch (_) {
                              secondbase = 'invalid input';
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'First Side',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController3,
                              onChanged: (value) {
                                try {
                                  firstside = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  firstside = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'Second Side',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController4,
                          onChanged: (value) {
                            try {
                              secondside = '${TeXParser(value).parse()}';
                            } catch (_) {
                              secondside = 'invalid input';
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            if (firstbase == "invalid input" ||
                                secondbase == "invalid input" ||
                                firstside == "invalid input" ||
                                secondside == "invalid input") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse =
                                  "$firstbase,$secondbase,$firstside,$secondside";
                              final url =
                                  'http://127.0.0.1:5000/api/perimetretrapezoid/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Find Perimeter',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class PerimetreTriangle extends StatefulWidget {
  const PerimetreTriangle({Key? key}) : super(key: key);

  @override
  _PerimetreTriangleState createState() => _PerimetreTriangleState();
}

class _PerimetreTriangleState extends State<PerimetreTriangle> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();
  final MathFieldEditingController textController3 =
      MathFieldEditingController();

  String side1 = '';
  String side2 = '';
  String base = '';

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Perimeter Triangle.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Side 1',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  side1 = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  side1 = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'Side 2',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController2,
                          onChanged: (value) {
                            try {
                              side2 = '${TeXParser(value).parse()}';
                            } catch (_) {
                              side2 = 'invalid input';
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Base',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController3,
                              onChanged: (value) {
                                try {
                                  base = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  base = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            if (base == "invalid input" ||
                                side1 == "invalid input" ||
                                side2 == "invalid input") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse = "$side1,$side2,$base";
                              final url =
                                  'http://127.0.0.1:5000/api/perimetretriangle/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Find Perimeter',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleIntrest extends StatefulWidget {
  const SimpleIntrest({Key? key}) : super(key: key);

  @override
  _SimpleIntrestState createState() => _SimpleIntrestState();
}

class _SimpleIntrestState extends State<SimpleIntrest> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();
  final MathFieldEditingController textController3 =
      MathFieldEditingController();

  String initialprincipalbalance = '';
  String annualinterestrate = '';
  String time = '';

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Simple Interest.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Initial Principal Balance',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  initialprincipalbalance =
                                      '${TeXParser(value).parse()}';
                                } catch (_) {
                                  initialprincipalbalance = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'Annual Interest Rate',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController2,
                          onChanged: (value) {
                            try {
                              annualinterestrate =
                                  '${TeXParser(value).parse()}';
                            } catch (_) {
                              annualinterestrate = 'invalid input';
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Time (years)',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController3,
                              onChanged: (value) {
                                try {
                                  time = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  time = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            if (initialprincipalbalance == "invalid input" ||
                                annualinterestrate == "invalid input" ||
                                time == "invalid input") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse =
                                  "$initialprincipalbalance,$annualinterestrate,$time";
                              final url =
                                  'http://127.0.0.1:5000/api/simpleintrest/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Calculate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class CompoundIntrest extends StatefulWidget {
  const CompoundIntrest({Key? key}) : super(key: key);

  @override
  _CompoundIntrestState createState() => _CompoundIntrestState();
}

class _CompoundIntrestState extends State<CompoundIntrest> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();
  final MathFieldEditingController textController3 =
      MathFieldEditingController();

  String initialprincipalbalance = '';
  String annualinterestrate = '';
  String time = '';

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Compound Interest.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Initial Principal Balance',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  initialprincipalbalance =
                                      '${TeXParser(value).parse()}';
                                } catch (_) {
                                  initialprincipalbalance = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'Annual Interest Rate',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController2,
                          onChanged: (value) {
                            try {
                              annualinterestrate =
                                  '${TeXParser(value).parse()}';
                            } catch (_) {
                              annualinterestrate = 'invalid input';
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Time (years)',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController3,
                              onChanged: (value) {
                                try {
                                  time = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  time = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            if (initialprincipalbalance == "invalid input" ||
                                initialprincipalbalance == "" ||
                                annualinterestrate == "invalid input" ||
                                annualinterestrate == "" ||
                                time == "invalid input" ||
                                time == "") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse =
                                  "$initialprincipalbalance,$annualinterestrate,$time";
                              final url =
                                  'http://127.0.0.1:5000/api/compoundintrest/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Calculate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class ArithmeticSequence extends StatefulWidget {
  const ArithmeticSequence({Key? key}) : super(key: key);

  @override
  _ArithmeticSequenceState createState() => _ArithmeticSequenceState();
}

class _ArithmeticSequenceState extends State<ArithmeticSequence> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();
  final MathFieldEditingController textController3 =
      MathFieldEditingController();

  String commondifference = '';
  String firstTerm = '';
  String numberofterms = '';

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Arithmetic Sequence.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Common Difference',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  commondifference =
                                      '${TeXParser(value).parse()}';
                                } catch (_) {
                                  commondifference = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'First Term',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController2,
                          onChanged: (value) {
                            try {
                              firstTerm = '${TeXParser(value).parse()}';
                            } catch (_) {
                              firstTerm = 'invalid input';
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Nth Term',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController3,
                              onChanged: (value) {
                                try {
                                  numberofterms = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  numberofterms = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            if (commondifference == "invalid input" ||
                                commondifference == "" ||
                                firstTerm == "invalid input" ||
                                firstTerm == "" ||
                                numberofterms == "invalid input" ||
                                numberofterms == "") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse =
                                  "$commondifference,$firstTerm,$numberofterms";
                              final url =
                                  'http://127.0.0.1:5000/api/arithmeticsequence/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Calculate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class GeometricSequence extends StatefulWidget {
  const GeometricSequence({Key? key}) : super(key: key);

  @override
  _GeometricSequenceState createState() => _GeometricSequenceState();
}

class _GeometricSequenceState extends State<GeometricSequence> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();
  final MathFieldEditingController textController3 =
      MathFieldEditingController();

  String commondratio = '';
  String firstTerm = '';
  String numberofterms = '';

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Geometric Sequence.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Common Ratio',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                try {
                                  commondratio = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  commondratio = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'First Term',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController2,
                          onChanged: (value) {
                            try {
                              firstTerm = '${TeXParser(value).parse()}';
                            } catch (_) {
                              firstTerm = 'invalid input';
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'Nth Term',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController3,
                              onChanged: (value) {
                                try {
                                  numberofterms = '${TeXParser(value).parse()}';
                                } catch (_) {
                                  numberofterms = 'invalid input';
                                }
                              },
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            if (commondratio == "invalid input" ||
                                commondratio == "" ||
                                firstTerm == "invalid input" ||
                                firstTerm == "" ||
                                numberofterms == "invalid input" ||
                                numberofterms == "") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse =
                                  "$commondratio,$firstTerm,$numberofterms";
                              final url =
                                  'http://127.0.0.1:5000/api/geometricsequence/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Calculate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class QuadraticEquation extends StatefulWidget {
  const QuadraticEquation({Key? key}) : super(key: key);

  @override
  _QuadraticEquationState createState() => _QuadraticEquationState();
}

class _QuadraticEquationState extends State<QuadraticEquation> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();
  final MathFieldEditingController textController3 =
      MathFieldEditingController();

  String a = '1';
  String b = '1';
  String c = '1';

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Quadratic Equation.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'a',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController1,
                              onChanged: (value) {
                                a = value;
                              },
                            )),
                      ),
                    ),
                    Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: MathField(
                          variables: const ['x', 'y', 'z', '='],
                          decoration: InputDecoration(
                            labelText: 'b',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey[300]),
                          ),
                          controller: textController2,
                          onChanged: (value) {
                            b = value;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                              keyboardType: MathKeyboardType.expression,
                              variables: const ['x', 'y', 'z', '='],
                              decoration: InputDecoration(
                                labelText: 'c',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey[300]),
                              ),
                              controller: textController3,
                              onChanged: (value) {
                                c = value;
                              },
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            String afinal;
                            String bfinal;
                            String cfinal;
                            a = a.replaceAll('+', '');
                            b = b.replaceAll('+', '');
                            c = c.replaceAll('+', '');
                            try {
                              afinal = '${TeXParser(a).parse()}';
                              bfinal = '${TeXParser(b).parse()}';
                              cfinal = '${TeXParser(c).parse()}';
                            } catch (_) {
                              afinal = "invalid input";
                              bfinal = "invalid input";
                              cfinal = "invalid input";
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            }
                            if (afinal == "invalid input" ||
                                bfinal == "invalid input" ||
                                cfinal == "invalid input") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text("INVALID INPUT"),
                                  );
                                },
                              );
                            } else {
                              String finalResponse = "$afinal,$bfinal,$cfinal";
                              finalResponse =
                                  Uri.encodeComponent(finalResponse);
                              final url =
                                  'http://127.0.0.1:5000/api/quadraticequation/?query=$finalResponse';
                              final response = await http.get(Uri.parse(url));
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.body),
                                  );
                                },
                              );
                              dispose();
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Calculate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class MeanStatistics extends StatefulWidget {
  const MeanStatistics({Key? key}) : super(key: key);

  @override
  _MeanStatisticsState createState() => _MeanStatisticsState();
}

class _MeanStatisticsState extends State<MeanStatistics> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();

  String input = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'CALCULATE MEAN.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                                keyboardType: MathKeyboardType.expression,
                                variables: const ['x', 'y', 'z', '='],
                                decoration: InputDecoration(
                                  labelText: 'data (separate with comma)',
                                  border: InputBorder.none,
                                  labelStyle:
                                      TextStyle(color: Colors.grey[300]),
                                ),
                                controller: textController1,
                                onChanged: (value) {
                                  input = value;
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            String finalResponse = input;

                            final url =
                                'http://127.0.0.1:5000/api/mean/?query=$finalResponse';
                            final response = await http.get(Uri.parse(url));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(response.body),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'CALCULATE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class MedianStatistics extends StatefulWidget {
  const MedianStatistics({Key? key}) : super(key: key);

  @override
  _MedianStatisticsState createState() => _MedianStatisticsState();
}

class _MedianStatisticsState extends State<MedianStatistics> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();

  String input = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'CALCULATE MEDIAN.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                                keyboardType: MathKeyboardType.expression,
                                variables: const ['x', 'y', 'z', '='],
                                decoration: InputDecoration(
                                  labelText: 'data (separate with comma)',
                                  border: InputBorder.none,
                                  labelStyle:
                                      TextStyle(color: Colors.grey[300]),
                                ),
                                controller: textController1,
                                onChanged: (value) {
                                  input = value;
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            String finalResponse = input;
                            final url =
                                'http://127.0.0.1:5000/api/median/?query=$finalResponse';
                            final response = await http.get(Uri.parse(url));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(response.body),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'CALCULATE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class MedianHighStatistics extends StatefulWidget {
  const MedianHighStatistics({Key? key}) : super(key: key);

  @override
  _MedianHighStatisticsState createState() => _MedianHighStatisticsState();
}

class _MedianHighStatisticsState extends State<MedianHighStatistics> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();

  String input = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'CALCULATE MEDIAN HIGH.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                                keyboardType: MathKeyboardType.expression,
                                variables: const ['x', 'y', 'z', '='],
                                decoration: InputDecoration(
                                  labelText: 'data (separate with comma)',
                                  border: InputBorder.none,
                                  labelStyle:
                                      TextStyle(color: Colors.grey[300]),
                                ),
                                controller: textController1,
                                onChanged: (value) {
                                  input = value;
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            String finalResponse = input;
                            final url =
                                'http://127.0.0.1:5000/api/median_high/?query=$finalResponse';
                            final response = await http.get(Uri.parse(url));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(response.body),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'CALCULATE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class MedianLowStatistics extends StatefulWidget {
  const MedianLowStatistics({Key? key}) : super(key: key);

  @override
  _MedianLowStatisticsState createState() => _MedianLowStatisticsState();
}

class _MedianLowStatisticsState extends State<MedianLowStatistics> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();

  String input = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'CALCULATE MEDIAN LOW.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                                keyboardType: MathKeyboardType.expression,
                                variables: const ['x', 'y', 'z', '='],
                                decoration: InputDecoration(
                                  labelText: 'data (separate with comma)',
                                  border: InputBorder.none,
                                  labelStyle:
                                      TextStyle(color: Colors.grey[300]),
                                ),
                                controller: textController1,
                                onChanged: (value) {
                                  input = value;
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            String finalResponse = input;
                            final url =
                                'http://127.0.0.1:5000/api/median_low/?query=$finalResponse';
                            final response = await http.get(Uri.parse(url));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(response.body),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'CALCULATE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class ModeStatistics extends StatefulWidget {
  const ModeStatistics({Key? key}) : super(key: key);

  @override
  _ModeStatisticsState createState() => _ModeStatisticsState();
}

class _ModeStatisticsState extends State<ModeStatistics> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();

  String input = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'CALCULATE MODE.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                                keyboardType: MathKeyboardType.expression,
                                variables: const ['x', 'y', 'z', '='],
                                decoration: InputDecoration(
                                  labelText: 'data (separate with comma)',
                                  border: InputBorder.none,
                                  labelStyle:
                                      TextStyle(color: Colors.grey[300]),
                                ),
                                controller: textController1,
                                onChanged: (value) {
                                  input = value;
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            String finalResponse = input;
                            final url =
                                'http://127.0.0.1:5000/api/mode/?query=$finalResponse';
                            final response = await http.get(Uri.parse(url));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(response.body),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'CALCULATE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class STDEVStatistics extends StatefulWidget {
  const STDEVStatistics({Key? key}) : super(key: key);

  @override
  _STDEVStatisticsState createState() => _STDEVStatisticsState();
}

class _STDEVStatisticsState extends State<STDEVStatistics> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();

  String input = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'CALCULATE SAMPLE STANDARD DEVIATION.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                                keyboardType: MathKeyboardType.expression,
                                variables: const ['x', 'y', 'z', '='],
                                decoration: InputDecoration(
                                  labelText: 'data (separate with comma)',
                                  border: InputBorder.none,
                                  labelStyle:
                                      TextStyle(color: Colors.grey[300]),
                                ),
                                controller: textController1,
                                onChanged: (value) {
                                  input = value;
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            String finalResponse = input;
                            final url =
                                'http://127.0.0.1:5000/api/stdev/?query=$finalResponse';
                            final response = await http.get(Uri.parse(url));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(response.body),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'CALCULATE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class PSTDEVStatistics extends StatefulWidget {
  const PSTDEVStatistics({Key? key}) : super(key: key);

  @override
  _PSTDEVStatisticsState createState() => _PSTDEVStatisticsState();
}

class _PSTDEVStatisticsState extends State<PSTDEVStatistics> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();

  String input = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'CALCULATE POPULATION STANDARD DEVIATION.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                                keyboardType: MathKeyboardType.expression,
                                variables: const ['x', 'y', 'z', '='],
                                decoration: InputDecoration(
                                  labelText: 'data (separate with comma)',
                                  border: InputBorder.none,
                                  labelStyle:
                                      TextStyle(color: Colors.grey[300]),
                                ),
                                controller: textController1,
                                onChanged: (value) {
                                  input = value;
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            String finalResponse = input;
                            final url =
                                'http://127.0.0.1:5000/api/pstdev/?query=$finalResponse';
                            final response = await http.get(Uri.parse(url));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(response.body),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'CALCULATE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class VarianceStatistics extends StatefulWidget {
  const VarianceStatistics({Key? key}) : super(key: key);

  @override
  _VarianceStatisticsState createState() => _VarianceStatisticsState();
}

class _VarianceStatisticsState extends State<VarianceStatistics> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();

  String input = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'CALCULATE SAMPLE VARIANCE.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                                keyboardType: MathKeyboardType.expression,
                                variables: const ['x', 'y', 'z', '='],
                                decoration: InputDecoration(
                                  labelText: 'data (separate with comma)',
                                  border: InputBorder.none,
                                  labelStyle:
                                      TextStyle(color: Colors.grey[300]),
                                ),
                                controller: textController1,
                                onChanged: (value) {
                                  input = value;
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            String finalResponse = input;
                            final url =
                                'http://127.0.0.1:5000/api/variance/?query=$finalResponse';
                            final response = await http.get(Uri.parse(url));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(response.body),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'CALCULATE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class PVarianceStatistics extends StatefulWidget {
  const PVarianceStatistics({Key? key}) : super(key: key);

  @override
  _PVarianceStatisticsState createState() => _PVarianceStatisticsState();
}

class _PVarianceStatisticsState extends State<PVarianceStatistics> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();

  String input = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'CALCULATE POPULATION VARIANCE.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                                keyboardType: MathKeyboardType.expression,
                                variables: const ['x', 'y', 'z', '='],
                                decoration: InputDecoration(
                                  labelText: 'data (separate with comma)',
                                  border: InputBorder.none,
                                  labelStyle:
                                      TextStyle(color: Colors.grey[300]),
                                ),
                                controller: textController1,
                                onChanged: (value) {
                                  input = value;
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            String finalResponse = input;
                            final url =
                                'http://127.0.0.1:5000/api/pvariance/?query=$finalResponse';
                            final response = await http.get(Uri.parse(url));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(response.body),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'CALCULATE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class ConvertDR extends StatefulWidget {
  const ConvertDR({Key? key}) : super(key: key);

  @override
  _ConvertDRState createState() => _ConvertDRState();
}

class _ConvertDRState extends State<ConvertDR> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();

  String input = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'CONVERT DEGREES TO RADIANS.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                                keyboardType: MathKeyboardType.expression,
                                variables: const ['x', 'y', 'z', '='],
                                decoration: InputDecoration(
                                  labelText: 'degrees',
                                  border: InputBorder.none,
                                  labelStyle:
                                      TextStyle(color: Colors.grey[300]),
                                ),
                                controller: textController1,
                                onChanged: (value) {
                                  input = value;
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            String finalResponse = input;
                            final url =
                                'http://127.0.0.1:5000/api/convertdr/?query=$finalResponse';
                            final response = await http.get(Uri.parse(url));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(response.body),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'CALCULATE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}

class ConvertRD extends StatefulWidget {
  const ConvertRD({Key? key}) : super(key: key);

  @override
  _ConvertRDState createState() => _ConvertRDState();
}

class _ConvertRDState extends State<ConvertRD> {
  final MathFieldEditingController textController1 =
      MathFieldEditingController();

  String input = '';

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('login_06.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MATHUEMPORIUM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'CONVERT RADIANS TO DEGREES.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: MathField(
                                keyboardType: MathKeyboardType.expression,
                                variables: const ['x', 'y', 'z', '='],
                                decoration: InputDecoration(
                                  labelText: 'radians',
                                  border: InputBorder.none,
                                  labelStyle:
                                      TextStyle(color: Colors.grey[300]),
                                ),
                                controller: textController1,
                                onChanged: (value) {
                                  input = value;
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MathematicalTools()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600]!,
                                    Colors.grey[800]!
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Change Calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          onPressed: () async {
                            String finalResponse = input;
                            final url =
                                'http://127.0.0.1:5000/api/convertrd/?query=$finalResponse';
                            final response = await http.get(Uri.parse(url));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(response.body),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'CALCULATE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card())
            ],
          ),
        ),
      ),
    );
  }
}
