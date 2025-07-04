import 'package:flutter/material.dart';
import 'dart:ui';
import '../../core/constants.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final bool isDark;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? AppSizes.radiusLarge),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: AppSizes.glassBlur,
            sigmaY: AppSizes.glassBlur,
          ),
          child: Container(
            padding: padding ?? const EdgeInsets.all(AppSizes.paddingMedium),
            decoration: BoxDecoration(
              color: isDark 
                  ? AppColors.darkGlassBackground 
                  : AppColors.glassBackground,
              borderRadius: BorderRadius.circular(borderRadius ?? AppSizes.radiusLarge),
              border: Border.all(
                color: isDark 
                    ? AppColors.darkGlassBorder 
                    : AppColors.glassBorder,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark 
                      ? Colors.black.withOpacity(0.3)
                      : Colors.white.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class AnimatedGlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final bool isDark;
  final VoidCallback? onTap;

  const AnimatedGlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.isDark = false,
    this.onTap,
  });

  @override
  State<AnimatedGlassCard> createState() => _AnimatedGlassCardState();
}

class _AnimatedGlassCardState extends State<AnimatedGlassCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppAnimations.fast,
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: AppAnimations.easeInOut,
    ));
    
    _elevationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: AppAnimations.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTap != null ? _onTapDown : null,
      onTapUp: widget.onTap != null ? _onTapUp : null,
      onTapCancel: widget.onTap != null ? _onTapCancel : null,
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              margin: widget.margin,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? AppSizes.radiusLarge,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: AppSizes.glassBlur,
                    sigmaY: AppSizes.glassBlur,
                  ),
                  child: Container(
                    padding: widget.padding ?? const EdgeInsets.all(AppSizes.paddingMedium),
                    decoration: BoxDecoration(
                      color: widget.isDark 
                          ? AppColors.darkGlassBackground 
                          : AppColors.glassBackground,
                      borderRadius: BorderRadius.circular(
                        widget.borderRadius ?? AppSizes.radiusLarge,
                      ),
                      border: Border.all(
                        color: widget.isDark 
                            ? AppColors.darkGlassBorder 
                            : AppColors.glassBorder,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: (widget.isDark 
                              ? Colors.black 
                              : Colors.white).withOpacity(0.3 * _elevationAnimation.value),
                          blurRadius: 20 * _elevationAnimation.value,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: widget.child,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
} 