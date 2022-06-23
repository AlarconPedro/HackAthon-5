import 'package:flutter/material.dart';
import 'tab_item.dart';
import 'package:vector_math/vector_math.dart' as vector;
import 'package:hackathon/ui/components/components.dart';
import 'package:hackathon/ui/decoration/decoration.dart';
import 'package:hackathon/ui/pages/pages.dart';

class BarraNavegacao extends StatefulWidget {
  @override
  _BarraNavegacaoState createState() => _BarraNavegacaoState();
}

class _BarraNavegacaoState extends State<BarraNavegacao>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Tween<double> _positionTween;
  late Animation<double> _positionAnimation;

  late AnimationController _fadeOutController;
  late Animation<double> _fadeFabOutAnimation;
  late Animation<double> _fadeFabInAnimation;

  late TabController _tabController;

  double fabIconAlpha = 1;
  IconData nextIcon = Icons.list_outlined;
  IconData activeIcon = Icons.list_outlined;

  int currentSelected = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: ANIM_DURATION));
    _fadeOutController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: (ANIM_DURATION ~/ 5)));

    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_tabControllerSelection);

    _positionTween = Tween<double>(begin: 0, end: 0);
    _positionAnimation = _positionTween.animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _fadeFabOutAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _fadeOutController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabOutAnimation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            activeIcon = nextIcon;
          });
        }
      });

    _fadeFabInAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.8, 1, curve: Curves.easeOut)))
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabInAnimation.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cores.cinza,
      child: navBar(),
    );
  }

  Widget tabItens() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <TabItem>[
        TabItem(
          selected: currentSelected == 0,
          iconData: Icons.home,
          title: "Home",
          controller: _tabController,
          callbackFunction: () {
            setState(
              () {
                nextIcon = Icons.home;
                currentSelected = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoricoPage(),
                  ),
                );
              },
            );
            _initAnimationAndStart(_positionAnimation.value, -1);
          },
        ),
        TabItem(
            selected: currentSelected == 1,
            iconData: Icons.list_outlined,
            title: "Lista",
            controller: _tabController,
            callbackFunction: () {
              setState(() {
                nextIcon = Icons.list_outlined;
                currentSelected = 1;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoricoPage(),
                  ),
                );
              });
              _initAnimationAndStart(_positionAnimation.value, 0);
            }),
        TabItem(
          selected: currentSelected == 2,
          iconData: Icons.history_outlined,
          title: "Histórico",
          controller: _tabController,
          callbackFunction: () {
            setState(() {
              nextIcon = Icons.history_outlined;
              currentSelected = 2;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoricoPage(),
                ),
              );
            });
            _initAnimationAndStart(_positionAnimation.value, 1);
          },
        ),
      ],
    );
  }

  _initAnimationAndStart(double from, double to) {
    _positionTween.begin = from;
    _positionTween.end = to;

    _animationController.reset();
    _fadeOutController.reset();
    _animationController.forward();
    _fadeOutController.forward();
  }

  int _tabControllerSelection() {
    if (currentSelected == 0) {
      // _iTabSelecionada = _tabController.index;
      setState(() {
        navBar();
      });
    }
    if (currentSelected == 1) {
      // _iTabSelecionada = _tabController.index;
      setState(() {
        navBar();
      });
    }
    if (currentSelected == 2) {
      // _iTabSelecionada = _tabController.index;
      setState(() {
        navBar();
      });
    }
    return currentSelected;
  }

  Widget navBar() {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: 65,
          margin: const EdgeInsets.only(top: 45),
          decoration: BoxDecoration(color: Cores.branco, boxShadow: [
            BoxShadow(
                color: Cores.laranja,
                offset: const Offset(0, -1),
                blurRadius: 8)
          ]),
          child: tabItens(),
        ),
        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(color: Cores.transparente),
            child: Align(
              heightFactor: 1,
              alignment: Alignment(_positionAnimation.value, 0),
              child: FractionallySizedBox(
                widthFactor: 1 / 3,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: ClipRect(
                        clipper: HalfClipper(),
                        child: Container(
                          child: Center(
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Cores.cinza,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(color: Cores.laranja, blurRadius: 8)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 70,
                        width: 90,
                        child: CustomPaint(
                          painter: HalfPainter(),
                        )),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Cores.laranja,
                            border: Border.all(
                                color: Cores.cinza,
                                width: 5,
                                style: BorderStyle.none)),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Opacity(
                            opacity: fabIconAlpha,
                            child: Icon(
                              activeIcon,
                              color: Cores.branco,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height / 2);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class HalfPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect beforeRect = Rect.fromLTWH(0, (size.height / 2) - 10, 10, 10);
    final Rect largeRect = Rect.fromLTWH(10, 0, size.width - 20, 70);
    final Rect afterRect =
        Rect.fromLTWH(size.width - 10, (size.height / 2) - 10, 10, 10);

    final path = Path();
    path.arcTo(beforeRect, vector.radians(0), vector.radians(90), false);
    path.lineTo(20, size.height / 2);
    path.arcTo(largeRect, vector.radians(0), -vector.radians(180), false);
    path.moveTo(size.width - 10, size.height / 2);
    path.lineTo(size.width - 10, (size.height / 2) - 10);
    path.arcTo(afterRect, vector.radians(180), vector.radians(-90), false);
    path.close();

    canvas.drawPath(path, Paint()..color = Cores.branco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
