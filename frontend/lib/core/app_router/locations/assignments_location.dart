// import 'package:beamer/beamer.dart';
// import 'package:flutter/material.dart';

// class AssignmentsLocation extends BeamLocation<BeamState> {
//   @override
//   List<Pattern> get pathPatterns => [
//         '/course/:courseId/assignments',
//         '/course/:courseId/assignments/:assignmentId',
//       ];

//   @override
//   List<BeamPage> buildPages(BuildContext context, BeamState state) {
//     final courseId = state.pathParameters['courseId'];
//     final assignmentId = state.pathParameters['assignmentId'];

//     if (assignmentId != null) {
//       // Route for assignment detail page
//       return [
//         BeamPage(
//           key: ValueKey('AssignmentDetail-$assignmentId'),
//           title: 'Assignment $assignmentId',
//           child: AssignmentDetailPage(assignmentId: assignmentId),
//         ),
//       ];
//     }

//     // Route for assignments list
//     return [
//       const BeamPage(
//         key: ValueKey('AssignmentsList'),
//         title: 'Assignments',
//         child: AssignmentsTabView(),
//       ),
//     ];
//   }
// }

// class AssignmentDetailPage extends StatelessWidget {
//   final String assignmentId;
//   const AssignmentDetailPage({required this.assignmentId, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Text('Assignment detail page');
//   }
// }

// class AssignmentsTabView extends StatelessWidget {
//   const AssignmentsTabView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Text('Assignment detail page');
//   }
// }
