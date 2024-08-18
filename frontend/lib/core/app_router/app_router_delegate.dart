import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/core/app_router/locations/auth_location.dart';
import 'package:lms_front/core/app_router/locations/course_location.dart';
import 'package:lms_front/core/app_router/locations/lessons_location.dart';
import 'package:lms_front/core/app_router/locations/main_page_location.dart';
import 'package:lms_front/features/auth/domain/auth_cubit.dart';

class AppRouterDelegate extends BeamerDelegate {
  AppRouterDelegate()
      : super(
          locationBuilder: BeamerLocationBuilder(
            beamLocations: [
              MainPageLocation(),
              AuthLocation(),
              CourseLocation(),
              LessonsLocation(),
              // AssignmentsLocation(),
            ],
          ),
          guards: [
            BeamGuard(
              pathPatterns: ['/course/:courseId'],
              check: (context, location) => false,
              beamToNamed: (origin, target) => '/program',
            ),
            BeamGuard(
              pathPatterns: ['/auth/*'],
              guardNonMatching: true,
              check: (context, location) =>
                  context.read<AuthStore>().isAuthenticated(),
              beamToNamed: (origin, target) => '/auth',
            ),
          ],
        );
}
