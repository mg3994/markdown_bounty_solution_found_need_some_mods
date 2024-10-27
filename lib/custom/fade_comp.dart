// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';

// /// Animates the opacity of a widget.
// ///
// /// For a widget that automatically animates between the sizes of two children,
// /// fading between them, see [AnimatedCrossFade].
// ///
// /// {@youtube 560 315 https://www.youtube.com/watch?v=rLwWVbv3xDQ}
// ///
// /// Here's an illustration of the [FadeTransition] widget, with it's [opacity]
// /// animated by a [CurvedAnimation] set to [Curves.fastOutSlowIn]:
// ///
// /// {@tool dartpad}
// /// The following code implements the [FadeTransition] using
// /// the Flutter logo:
// ///
// /// ** See code in examples/api/lib/widgets/transitions/fade_transition.0.dart **
// /// {@end-tool}
// ///
// /// ## Hit testing
// ///
// /// Setting the [opacity] to zero does not prevent hit testing from being
// /// applied to the descendants of the [FadeTransition] widget. This can be
// /// confusing for the user, who may not see anything, and may believe the area
// /// of the interface where the [FadeTransition] is hiding a widget to be
// /// non-interactive.
// ///
// /// With certain widgets, such as [Flow], that compute their positions only when
// /// they are painted, this can actually lead to bugs (from unexpected geometry
// /// to exceptions), because those widgets are not painted by the [FadeTransition]
// /// widget at all when the [opacity] animation reaches zero.
// ///
// /// To avoid such problems, it is generally a good idea to combine this widget
// /// with an [IgnorePointer] that one enables when the [opacity] animation
// /// reaches zero. This prevents interactions with any children in the subtree
// /// when the [child] is not visible. For performance reasons, when implementing
// /// this, care should be taken not to rebuild the relevant widget (e.g. by
// /// calling [State.setState]) except at the transition point.
// ///
// /// See also:
// ///
// ///  * [Opacity], which does not animate changes in opacity.
// ///  * [AnimatedOpacity], which animates changes in opacity without taking an
// ///    explicit [Animation] argument.
// ///  * [SliverFadeTransition], the sliver version of this widget.
// class FadeTransition extends SingleChildRenderObjectWidget {
//   /// Creates an opacity transition.
//   const FadeTransition({
//     super.key,
//     required this.opacity,
//     this.alwaysIncludeSemantics = false,
//     required this.builder,
//     super.child,
//   });

//   final Widget Function(BuildContext, double, double, Widget) builder;

//   /// The animation that controls the opacity of the child.
//   ///
//   /// If the current value of the opacity animation is v, the child will be
//   /// painted with an opacity of v. For example, if v is 0.5, the child will be
//   /// blended 50% with its background. Similarly, if v is 0.0, the child will be
//   /// completely transparent.
//   final Animation<double> opacity;

//   /// Whether the semantic information of the children is always included.
//   ///
//   /// Defaults to false.
//   ///
//   /// When true, regardless of the opacity settings the child semantic
//   /// information is exposed as if the widget were fully visible. This is
//   /// useful in cases where labels may be hidden during animations that
//   /// would otherwise contribute relevant semantics.
//   final bool alwaysIncludeSemantics;

//   /// Whether this widget is ignored during hit testing.
//   ///
//   /// Regardless of whether this widget is ignored during hit testing, it will
//   /// still consume space during layout and be visible during painting.
//   ///
//   /// {@macro flutter.widgets.IgnorePointer.semantics}
//   ///
//   /// Defaults to true.
//   final bool ignoring;

//   /// Whether the semantics of this widget is ignored when compiling the
//   /// semantics subtree.
//   ///
//   /// {@macro flutter.widgets.IgnorePointer.ignoringSemantics}
//   ///
//   /// See [SemanticsNode] for additional information about the semantics tree.
//   @Deprecated(
//       'Use ExcludeSemantics or create a custom ignore pointer widget instead. '
//       'This feature was deprecated after v3.8.0-12.0.pre.')
//   final bool? ignoringSemantics;

//   @override
//   RenderIgnorePointer createRenderObject(BuildContext context) {
//     return RenderIgnorePointer(
//         ignoring: ignoring,
//         ignoringSemantics: ignoringSemantics,
//         child: RenderAnimatedOpacity(
//           opacity: opacity,
//           alwaysIncludeSemantics: alwaysIncludeSemantics,
//         ));
//   }

//   @override
//   void updateRenderObject(
//       BuildContext context, RenderIgnorePointer renderObject) {
//     renderObject
//       ..ignoring = ignoring
//       ..ignoringSemantics = ignoringSemantics;
//     renderObject.child as RenderAnimatedOpacity
//       ..opacity = opacity
//       ..alwaysIncludeSemantics = alwaysIncludeSemantics;
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DiagnosticsProperty<bool>('ignoring', ignoring));
//     properties.add(DiagnosticsProperty<bool>(
//         'ignoringSemantics', ignoringSemantics,
//         defaultValue: null));
//     properties.add(DiagnosticsProperty<Animation<double>>('opacity', opacity));
//     properties.add(FlagProperty('alwaysIncludeSemantics',
//         value: alwaysIncludeSemantics, ifTrue: 'alwaysIncludeSemantics'));
//   }
// }
