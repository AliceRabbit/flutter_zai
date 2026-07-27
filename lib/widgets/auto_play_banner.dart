import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zaix/app/app_style.dart';

typedef BannerTitleBuilder = String Function(int index);

/// A small, dependency-free banner carousel built on Flutter's [PageView].
class AutoPlayBanner extends StatefulWidget {
  const AutoPlayBanner({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.titleBuilder,
    required this.onTap,
    this.autoPlayInterval = const Duration(seconds: 5),
    this.pageTransitionDuration = const Duration(milliseconds: 350),
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final BannerTitleBuilder titleBuilder;
  final ValueChanged<int> onTap;
  final Duration autoPlayInterval;
  final Duration pageTransitionDuration;

  @override
  State<AutoPlayBanner> createState() => _AutoPlayBannerState();
}

class _AutoPlayBannerState extends State<AutoPlayBanner>
    with WidgetsBindingObserver {
  final PageController _pageController = PageController();
  Timer? _autoPlayTimer;
  int _activeIndex = 0;
  bool _isUserDragging = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startAutoPlay();
  }

  @override
  void didUpdateWidget(covariant AutoPlayBanner oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_activeIndex >= widget.itemCount) {
      _activeIndex = 0;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _pageController.hasClients) {
          _pageController.jumpToPage(0);
        }
      });
    }
    if (oldWidget.itemCount != widget.itemCount ||
        oldWidget.autoPlayInterval != widget.autoPlayInterval) {
      _startAutoPlay();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _startAutoPlay();
    } else {
      _autoPlayTimer?.cancel();
    }
  }

  void _startAutoPlay() {
    _autoPlayTimer?.cancel();
    if (widget.itemCount <= 1) {
      return;
    }
    _autoPlayTimer = Timer.periodic(widget.autoPlayInterval, (_) {
      if (!_pageController.hasClients || _isUserDragging) {
        return;
      }
      final nextIndex = (_activeIndex + 1) % widget.itemCount;
      _pageController.animateToPage(
        nextIndex,
        duration: widget.pageTransitionDuration,
        curve: Curves.easeOutCubic,
      );
    });
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollStartNotification &&
        notification.dragDetails != null) {
      _isUserDragging = true;
      _autoPlayTimer?.cancel();
    } else if (notification is ScrollEndNotification) {
      _isUserDragging = false;
      _startAutoPlay();
    }
    return false;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount == 0) {
      return const SizedBox.shrink();
    }

    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.itemCount,
            allowImplicitScrolling: true,
            onPageChanged: (index) {
              setState(() {
                _activeIndex = index;
              });
            },
            itemBuilder: (context, index) => Semantics(
              button: true,
              label: widget.titleBuilder(index),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => widget.onTap(index),
                child: widget.itemBuilder(context, index),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 4, 12, 4),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black54, Colors.transparent],
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      widget.titleBuilder(_activeIndex),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  AppStyle.hGap8,
                  if (widget.itemCount > 1)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        widget.itemCount,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: index == _activeIndex ? 10 : 6,
                          height: 6,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color: index == _activeIndex
                                ? Colors.white
                                : Colors.white54,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
