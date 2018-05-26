library flushbar;

import 'package:flutter/material.dart';
import 'dart:async';

typedef void FlushbarStatusCallback(FlushbarStatus status);

/// A custom widget so you can notify your user when you fell like he needs an explanation.
/// This is inspired on a custom view (Flashbar)[https://github.com/aritraroy/Flashbar] created for android.
///
/// [title] The title displayed to the user (can be changed using [changeTitle]).
/// [message] The message displayed to the user.
/// [onStatusChanged] A callback used to listen to Flushbar status [FlushbarStatus]
/// [titleText] If you need something more personalized, pass a [Text] widget to this variable. [title] will be ignored if this variable is not null.
/// [messageText] If you need something more personalized, pass a [Text] widget to this variable. [message] will be ignored if this variable is not null.
/// [icon] The [Icon] indication what kind of message you are displaying.
/// [backgroundColor] Flushbar background color. Will be ignored if [backgroundGradient] is not null.
/// [shadowColor] The shadow generated by the Flushbar. Leave it null if you don't want a shadow.
/// [backgroundGradient] Flushbar background gradient. Makes [backgroundColor] be ignored.
/// [mainButton] A [FlatButton] widget if you need an action from the user.
/// [flushbarPosition] Flushbar can be based on [FlushbarPosition.TOP] or on [FlushbarPosition.BOTTOM] of your screen. [FlushbarPosition.BOTTOM] is the default.
/// [iconPosition] The icon can take [IconPosition.START] or [IconPosition.END]. [IconPosition.START] is default.
/// [duration] How long until Flushbar will hide itself (be dismissed). To make it indefinite, leave it null.
/// [isDismissible] Determines if the user can swipe to dismiss the bar. It is recommended that you set [duration] != null if [isDismissible] == false.
/// [forwardAnimationCurve] The [Curve] animation used when show() is called. [Curves.easeOut] is default.
/// [reverseAnimationCurve] The [Curve] animation used when dismiss() is called. [Curves.fastOutSlowIn] is default.
/// [linearProgressIndicator] An optional [LinearProgressIndicator] ideal when loading or uploading something
///
/// ATTENTION
/// The changes will take effect only after you call commitChanges().
/// Make sure to call commitChanges() only after Flushbar is dismissed so the user don't get confused.
/// I recommend using the change...(x) functions to change properties. You can call them directly too. In either case, call commitChanges() so the changes take effect.
/// Can't change [_mainScreenChild] after instantiation.
/// Can't change [flushbarPosition] after instantiation.
/// Can't change [forwardAnimationCurve] or [reverseAnimationCurve] curves after instantiation.
/// Make sure you call purge() if you are discarding the Flushbar.
/// Call purge only if you are discarding the Flushbar.

class Flushbar extends StatefulWidget {
  Flushbar(this.title, this.message,
      {this.onStatusChanged,
        this.titleText,
        this.messageText,
        this.icon,
        this.backgroundColor = const Color(0xFF303030),
        this.shadowColor,
        this.backgroundGradient,
        this.mainButton,
        this.flushbarPosition = FlushbarPosition.BOTTOM,
        this.iconPosition = IconPosition.START,
        this.duration,
        this.isDismissible = true,
        this.forwardAnimationCurve = Curves.easeOut,
        this.reverseAnimationCurve = Curves.fastOutSlowIn,
        this.linearProgressIndicator});

  FlushbarStatusCallback onStatusChanged;
  String title;
  String message;
  Text titleText;
  Text messageText;
  Color backgroundColor;
  Color shadowColor;
  Gradient backgroundGradient;
  Icon icon;
  FlatButton mainButton;
  FlushbarPosition flushbarPosition;
  IconPosition iconPosition;
  Duration duration;
  Curve forwardAnimationCurve;
  Curve reverseAnimationCurve;
  LinearProgressIndicator linearProgressIndicator;
  bool isDismissible;

  _FlushbarState flushbarState;

  /// For a cleaner code, use the change...() functions to customize the Flushbar properties
  /// after it has been created. Don't forget to call commitChanges after you are done
  /// or the changes won't take effect.
  Flushbar changeStatusListener(FlushbarStatusCallback onStatusChanged) {
    flushbarState._changeStatusListener(onStatusChanged);
    return this;
  }

  Flushbar changeTitle(String title) {
    flushbarState._changeTitle(title);
    return this;
  }

  Flushbar changeMessage(String message) {
    flushbarState._changeMessage(message);
    return this;
  }

  Flushbar changeTitleText(Text titleText) {
    flushbarState._changeTitleText(titleText);
    return this;
  }

  Flushbar changeMessageText(Text messageText) {
    flushbarState._changeMessageText(messageText);
    return this;
  }

  Flushbar changeBackgroundColor(Color backgroundColor) {
    flushbarState._changeBackgroundColor(backgroundColor);
    return this;
  }

  Flushbar changeShadowColor(Color shadowColor) {
    flushbarState._changeShadowColor(shadowColor);
    return this;
  }

  Flushbar changeBackgroundGradient(Gradient backgroundGradient) {
    flushbarState._changeBackgroundGradient(backgroundGradient);
    return this;
  }

  Flushbar changeMainButton(FlatButton mainButton) {
    flushbarState._changeMainButton(mainButton);
    return this;
  }

  Flushbar changeIconPosition(IconPosition iconPosition) {
    flushbarState._changeIconPosition(iconPosition);
    return this;
  }

  Flushbar changeDuration(Duration duration) {
    flushbarState._changeDuration(duration);
    return this;
  }

  Flushbar changeLinearProgressIndicator(
      LinearProgressIndicator linearProgressIndicator) {
    flushbarState._changeLinearProgressIndicator(linearProgressIndicator);
    return this;
  }

  Flushbar changeIsDismissible(bool isDismissible) {
    flushbarState._changeIsDismissible(isDismissible);
    return this;
  }

  Flushbar changeIcon(Icon icon) {
    flushbarState._changeIcon(icon);
    return this;
  }

  /// Makes the flushbar visible to the user starting all animations.
  void show() {
    flushbarState._show();
  }

  /// Hides the flushbar pausing all the animation.
  void dismiss() {
    flushbarState._dismiss();
  }

  void commitChanges() {
    flushbarState._commitChanges();
  }

  /// Releases resources and makes the current flushbar unusable
  void purge() {
    flushbarState._purge();
  }

  /// Checks if the flushbar is visible
  bool isShowing() {
    return flushbarState._isShowing();
  }

  /// Checks if the flushbar is hidden
  bool isDismissed() {
    return flushbarState._isDismissed();
  }

  @override
  State createState() {
    flushbarState = new _FlushbarState(title, message,
        onStatusChanged: onStatusChanged,
        titleText: titleText,
        messageText: messageText,
        icon: icon,
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
        backgroundGradient: backgroundGradient,
        mainButton: mainButton,
        flushbarPosition: flushbarPosition,
        iconPosition: iconPosition,
        duration: duration,
        isDismissible: isDismissible,
        forwardAnimationCurve: forwardAnimationCurve,
        reverseAnimationCurve: reverseAnimationCurve,
        linearProgressIndicator: linearProgressIndicator);

    return flushbarState;
  }
}

class _FlushbarState extends State<Flushbar> with TickerProviderStateMixin {
  _FlushbarState(this.title, this.message,
      {this.onStatusChanged,
        this.titleText,
        this.messageText,
        this.icon,
        this.backgroundColor,
        this.shadowColor,
        this.backgroundGradient,
        this.mainButton,
        this.flushbarPosition,
        this.iconPosition,
        this.duration,
        this.isDismissible = true,
        this.forwardAnimationCurve,
        this.reverseAnimationCurve,
        this.linearProgressIndicator}) {
    _animationStatusListener = (animationStatus) {
      switch (animationStatus) {
        case AnimationStatus.completed:
          {
            if (onStatusChanged != null) {
              currentStatus = FlushbarStatus.SHOWING;
              onStatusChanged(currentStatus);
            }
            if (duration != null) {
              if (timer != null) {
                timer.cancel();
              }
              timer = new Timer(duration, () {
                _popController.reverse();
              });
            }
            break;
          }

        case AnimationStatus.dismissed:
          {
            if (onStatusChanged != null) {
              currentStatus = FlushbarStatus.DISMISSED;
              onStatusChanged(currentStatus);
            }
            break;
          }

        case AnimationStatus.forward:
          {
            if (onStatusChanged != null) {
              currentStatus = FlushbarStatus.IS_APPEARING;
              onStatusChanged(currentStatus);
            }
            break;
          }

        case AnimationStatus.reverse:
          {
            if (onStatusChanged != null) {
              currentStatus = FlushbarStatus.IS_HIDING;
              onStatusChanged(currentStatus);
            }
            break;
          }
      }
    };
  }

  FlushbarStatusCallback onStatusChanged;
  String title;
  String message;
  Text titleText;
  Text messageText;
  Icon icon;
  Color backgroundColor;
  Color shadowColor;
  Gradient backgroundGradient;
  FlatButton mainButton;
  FlushbarPosition flushbarPosition;
  IconPosition iconPosition;
  Duration duration;
  Curve forwardAnimationCurve;
  Curve reverseAnimationCurve;
  LinearProgressIndicator linearProgressIndicator;
  bool isDismissible;

  BoxShadow _boxShadow;
  FlushbarStatus currentStatus;
  Timer timer;

  AnimationController _popController;
  Animation<Alignment> _popAnimation;
  AnimationController _fadeController;
  Animation<double> _fadeAnimation;

  EdgeInsets barInsets;
  AnimationStatusListener _animationStatusListener;

  final Widget _emptyWidget = SizedBox(width: 0.0, height: 0.0);
  final double _initialOpacity = 1.0;
  final double _finalOpacity = 0.4;

  final Duration _duration = Duration(seconds: 1);

  void _changeStatusListener(FlushbarStatusCallback onStatusChanged) {
    this.onStatusChanged = onStatusChanged;
    if (onStatusChanged != null) {
      this.onStatusChanged(currentStatus);
    }
  }

  void _changeTitle(String title) {
    this.title = title;
  }

  void _changeMessage(String message) {
    this.message = message;
  }

  void _changeTitleText(Text titleText) {
    this.titleText = titleText;
  }

  void _changeMessageText(Text messageText) {
    this.messageText = messageText;
  }

  void _changeBackgroundColor(Color backgroundColor) {
    this.backgroundColor = backgroundColor;
  }

  void _changeShadowColor(Color shadowColor) {
    this.shadowColor = shadowColor;
    _setBoxShadow();
  }

  void _changeBackgroundGradient(Gradient backgroundGradient) {
    this.backgroundGradient = backgroundGradient;
  }

  void _changeMainButton(FlatButton mainButton) {
    this.mainButton = mainButton;
  }

  void _changeIconPosition(IconPosition iconPosition) {
    this.iconPosition = iconPosition;
  }

  void _changeDuration(Duration duration) {
    this.duration = duration;
  }

  void _changeLinearProgressIndicator(
      LinearProgressIndicator linearProgressIndicator) {
    this.linearProgressIndicator = linearProgressIndicator;
  }

  void _changeIsDismissible(bool isDismissible) {
    this.isDismissible = isDismissible;
  }

  void _changeIcon(Icon icon) {
    this.icon = icon;
  }

  void _show() {
    _popController.forward();
    _fadeController.forward();
  }

  void _dismiss() {
    if (!_popController.isAnimating) {
      _popController.reverse();
      _fadeController.reset();
    }
  }

  void _commitChanges() {
    setState(() {});
  }

  bool _isShowing() {
    return _popController.isCompleted;
  }

  bool _isDismissed() {
    return _popController.isDismissed;
  }

  void _purge() {
    currentStatus = FlushbarStatus.PURGED;
    onStatusChanged(currentStatus);
    _popAnimation.removeStatusListener(_animationStatusListener);
    dispose();
  }

  void _resetAnimations() {
    _popController.reset();
    _fadeController.reset();
  }

  List<BoxShadow> _getBoxShadowList() {
    if (_boxShadow != null) {
      return [_boxShadow];
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    Alignment initialAlignment;
    Alignment endAlignment;

    switch (flushbarPosition) {
      case FlushbarPosition.TOP:
        {
          initialAlignment = new Alignment(-1.0, -2.0);
          endAlignment = new Alignment(-1.0, -1.0);
          barInsets = EdgeInsets.only(top: 24.0);
          _setBoxShadow();

          break;
        }
      case FlushbarPosition.BOTTOM:
        {
          initialAlignment = new Alignment(-1.0, 2.0);
          endAlignment = new Alignment(-1.0, 1.0);
          barInsets = EdgeInsets.only(top: 0.0);
          _setBoxShadow();

          break;
        }
    }

    _configurePopAnimation(initialAlignment, endAlignment);
    _configurePulseAnimation();

    _popController.forward();
  }

  void _configurePopAnimation(
      Alignment initialAlignment, Alignment endAlignment) {
    _popController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _popAnimation = AlignmentTween(begin: initialAlignment, end: endAlignment)
        .animate(new CurvedAnimation(
        parent: _popController,
        curve: forwardAnimationCurve,
        reverseCurve: reverseAnimationCurve));

    _popAnimation.addStatusListener(_animationStatusListener);

    _popController.addListener(() {
      setState(() {});
    });
  }

  void _configurePulseAnimation() {
    _fadeController = AnimationController(vsync: this, duration: _duration);
    _fadeAnimation =
        new Tween(begin: _initialOpacity, end: _finalOpacity).animate(
          new CurvedAnimation(
            parent: _fadeController,
            curve: Curves.linear,
          ),
        );

    _fadeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fadeController.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        _fadeController.forward();
      }
    });

    _fadeController.forward();
  }

  void _setBoxShadow() {
    switch (flushbarPosition) {
      case FlushbarPosition.TOP:
        {
          if (shadowColor != null) {
            _boxShadow = BoxShadow(
              color: shadowColor,
              offset: Offset(0.0, 2.0),
              blurRadius: 3.0,
            );
          }

          break;
        }
      case FlushbarPosition.BOTTOM:
        {
          if (shadowColor != null) {
            _boxShadow = BoxShadow(
              color: shadowColor,
              offset: Offset(0.0, -0.7),
              blurRadius: 3.0,
            );
          }

          break;
        }
    }
  }

  @override
  void dispose() {
    _popController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  /// This string is a workaround until Dismissible supports a returning item
  String dismissibleKeyGen = "";

  Widget _getFlushbar() {
    if (isDismissible) {
      return new Dismissible(
        key: Key(dismissibleKeyGen),
        onDismissed: (dismissDirection) {
          dismissibleKeyGen += "1";
          _resetAnimations();
        },
        child: _generateFlushbar(),
      );
    } else {
      return _generateFlushbar();
    }
  }

  Widget _generateFlushbar() {
    if (iconPosition == IconPosition.START) {
      return new DecoratedBox(
        decoration: new BoxDecoration(
          color: backgroundColor,
          gradient: backgroundGradient,
          boxShadow: _getBoxShadowList(),
        ),
        child: new Padding(
          padding: barInsets,
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              linearProgressIndicator ?? _emptyWidget,
              new Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _getIcon(),
                  new Expanded(
                    flex: 6,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, left: 8.0, right: 8.0),
                          child: titleText ?? _getDefaultTitleText(),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, right: 8.0, bottom: 16.0),
                          child: messageText ?? _getDefaultNotificationText(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              new Align(
                heightFactor: 1.0,
                alignment: Alignment.centerRight,
                child: new Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
                  child: _getMainActionButton(),
                ) ??
                    _emptyWidget,
              ),
            ],
          ),
        ),
      );
    } else {
      return new DecoratedBox(
        decoration: new BoxDecoration(
          color: backgroundColor,
          gradient: backgroundGradient,
          boxShadow: _getBoxShadowList(),
        ),
        child: new Padding(
          padding: barInsets,
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              linearProgressIndicator ?? _emptyWidget,
              new Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Expanded(
                    flex: 5,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, left: 8.0, right: 8.0),
                          child: titleText ?? _getDefaultTitleText(),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, right: 8.0, bottom: 16.0),
                          child: messageText ?? _getDefaultNotificationText(),
                        ),
                      ],
                    ),
                  ),
                  _getIcon(),
                ],
              ),
              new Align(
                heightFactor: 1.0,
                alignment: Alignment.centerRight,
                child: new Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: _getMainActionButton(),
                ) ??
                    _emptyWidget,
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _getIcon() {
    if (icon != null) {
      if (iconPosition == IconPosition.START) {
        return new Expanded(
          flex: 1,
          child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: icon,
            ),
          ),
        );
      } else {
        return new Expanded(
          flex: 1,
          child: new Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 8.0, bottom: 8.0, right: 16.0),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: icon,
            ),
          ),
        );
      }
    } else {
      return _emptyWidget;
    }
  }

  Text _getDefaultTitleText() {
    return new Text(
      title,
      style: TextStyle(
          fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Text _getDefaultNotificationText() {
    return new Text(
      message,
      style: TextStyle(fontSize: 16.0, color: Colors.white),
    );
  }

  FlatButton _getMainActionButton() {
    if (mainButton != null) {
      return mainButton;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Align(
      heightFactor: 1.0,
      child: new AlignTransition(
        alignment: _popAnimation,
        child: _getFlushbar(),
      ),
    );
  }
}

/// Indicates if flushbar is going to start at the [TOP] or at the [BOTTOM]
enum FlushbarPosition { TOP, BOTTOM }

/// Indicates if icon is at the [START] or [END] position
enum IconPosition { START, END }

/// Indicates the animation status
/// [FlushbarStatus.SHOWING] Flushbar has stopped and the user can see it
/// [FlushbarStatus.DISMISSED] Flushbar has stopped and the user can't see it
/// [FlushbarStatus.IS_APPEARING] Flushbar is moving towards [FlushbarStatus.SHOWING]
/// [FlushbarStatus.IS_HIDING] Flushbar is moving towards [] [FlushbarStatus.DISMISSED]
/// [FlushbarStatus.PURGED] Flushbar is discarded and won't move anymore
enum FlushbarStatus { SHOWING, DISMISSED, IS_APPEARING, IS_HIDING, PURGED }