import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sofiakb_elements/style.dart';
import 'package:sofiakb_elements/widgets.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({
    Key? key,
    required this.children,
    this.completedColor,
    this.completedTextColor,
    this.size = 60,
    this.nextButtonText = 'Suivant',
    this.previousButtonText = 'Précédent',
    this.nextButtonStyle,
    this.previousButtonStyle,
    this.currentPage,
    this.onPageChanged,
    this.withNextButton = true,
    this.withPreviousButton = true,
  }) : super(key: key);

  final List<Widget> children;
  final Color? completedColor;
  final Color? completedTextColor;

  final double size;

  final String nextButtonText;
  final String previousButtonText;
  final ButtonStyle? nextButtonStyle;
  final ButtonStyle? previousButtonStyle;
  final bool withNextButton;
  final bool withPreviousButton;

  final ValueNotifier<int>? currentPage;
  final bool Function(int currentPage)? onPageChanged;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  final PageController _pageController = PageController(keepPage: false);

  ValueNotifier<int> _page = ValueNotifier<int>(0);

  @override
  void initState() {
    _page = widget.currentPage ?? ValueNotifier<int>(0);
    if (widget.currentPage != null) {
      _page.addListener(() => changePage(widget.currentPage!.value));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: widget.size,
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _stepButtons()),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: widget.children,
            ),
          ),
          if (widget.withPreviousButton || widget.withNextButton)
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Row(
                mainAxisAlignment: _page.value == 0
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: _controlButtons()),
          ),
        ]);
  }

  Button _controlButton(String text,
          {required void Function() onPressed, ButtonStyle? style}) =>
      Button(
        text,
        onPressed: onPressed,
        style: style,
      );

  List<Button> _controlButtons() => [
        if (_page.value != 0 && widget.withPreviousButton)
          _controlButton(widget.previousButtonText,
              onPressed: () =>
                  changePage(_page.value > 0 ? _page.value - 1 : _page.value),
              style: widget.previousButtonStyle),
        if (widget.withNextButton)
          _controlButton(widget.nextButtonText,
              onPressed: () => changePage(
                  _page.value < widget.children.length - 1
                      ? _page.value + 1
                      : _page.value),
              style: widget.nextButtonStyle),
      ];

  List<Widget> _stepButtons() {
    List<Widget> stepButtons = [];

    widget.children.asMap().entries.forEach((e) {
      stepButtons.add(ProgressButton(
          size: widget.size,
          step: e.key,
          completedColor: widget.completedColor,
          completedTextColor: widget.completedTextColor,
          state: _page.value == e.key
              ? StepState.editing
              : _page.value > e.key
                  ? StepState.complete
                  : null,
          onTap: () => changePage(e.key)));
      if (e.key < widget.children.length - 1) {
        stepButtons.add(
          Expanded(
            child: Divider(
              thickness: 1,
              color: widget.completedColor ?? AppStyle.instance.primaryColor,
            ),
          ),
        );
      }
    });
    return stepButtons;
  }

  void changePage(int page) {
    setState(() {
      if (widget.onPageChanged != null) {
        if (widget.onPageChanged!(_page.value) == true) _page.value = page;
      } else {
        _page.value = page;
      }
    });
    _pageController.animateToPage(_page.value,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}

class ProgressButton extends StatelessWidget {
  final int step;
  final StepState? state;
  final Function()? onTap;

  final Color? completedColor;
  final Color? completedTextColor;

  final double size;

  const ProgressButton({
    Key? key,
    required this.step,
    this.state = StepState.indexed,
    this.onTap,
    this.completedColor,
    this.completedTextColor,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
          radius: size * 0.5,
          backgroundColor: Colors.transparent,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(size * 0.13),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: isActive()
                      ? completedColor ?? AppStyle.instance.primaryColor
                      : Colors.white,
                  borderRadius: AppStyle.roundedCircle,
                  border: Border.fromBorderSide(BorderSide(
                    color: completedColor ?? AppStyle.instance.primaryColor,
                  ))),
              child: Center(
                child: isActive()
                    ? FaIcon(
                        isEditing()
                            ? FontAwesomeIcons.pen
                            : FontAwesomeIcons.check,
                        size: size * 0.23,
                        color: completedTextColor ?? Colors.white)
                    : Text(
                        (step + 1).toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: isCompleted()
                                ? completedTextColor ?? Colors.white
                                : completedColor ?? AppStyle.instance.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: size * 0.33,
                            height: 1),
                      ),
              ),
            ),
          )),
      /*Stack(children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: size * 0.73,
                      height: size * 0.73,
                      decoration: BoxDecoration(
                        color: completedColor ?? AppStyle.primaryColor,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(44, 44)),
                      ))),
              Positioned(
                  top: 2,
                  left: 2,
                  child: Container(
                      width: size * .66,
                      height: size * .66,
                      decoration: BoxDecoration(
                        color: isActive()
                            ? completedColor ?? AppStyle.primaryColor
                            : Colors.white,
                        borderRadius:
                            AppStyle.roundedCircle,
                      ))),
              Positioned(
                  // top: 10,
                  // left: 14,
                  child: Center(
                child: isActive()
                    ? FaIcon(
                        isEditing()
                            ? FontAwesomeIcons.pen
                            : FontAwesomeIcons.check,
                        size: 14,
                        color: completedTextColor ?? Colors.white)
                    : Text(
                        (step + 1).toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: isCompleted()
                                ? completedTextColor ?? Colors.white
                                : completedColor ?? AppStyle.primaryColor,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),
              )),
            ]))*/
    );
  }

  bool isActive() => isCompleted() || isEditing();

  bool isCompleted() => state == StepState.complete;

  bool isEditing() => state == StepState.editing;
}
