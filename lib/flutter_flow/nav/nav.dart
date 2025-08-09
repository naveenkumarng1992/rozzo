import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : SignUpSignInWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : SignUpSignInWidget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HomePage')
              : HomePageWidget(),
        ),
        FFRoute(
          name: SignUpSignInWidget.routeName,
          path: SignUpSignInWidget.routePath,
          builder: (context, params) => SignUpSignInWidget(),
        ),
        FFRoute(
          name: LessonCompletedPageWidget.routeName,
          path: LessonCompletedPageWidget.routePath,
          builder: (context, params) => LessonCompletedPageWidget(),
        ),
        FFRoute(
          name: QuestionPageReviewWidget.routeName,
          path: QuestionPageReviewWidget.routePath,
          builder: (context, params) => QuestionPageReviewWidget(),
        ),
        FFRoute(
          name: QuestionPage1Widget.routeName,
          path: QuestionPage1Widget.routePath,
          builder: (context, params) => QuestionPage1Widget(),
        ),
        FFRoute(
          name: QuestsandBadgesWidget.routeName,
          path: QuestsandBadgesWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'QuestsandBadges')
              : QuestsandBadgesWidget(),
        ),
        FFRoute(
          name: FeedWidget.routeName,
          path: FeedWidget.routePath,
          builder: (context, params) => FeedWidget(),
        ),
        FFRoute(
          name: SectionPageWidget.routeName,
          path: SectionPageWidget.routePath,
          builder: (context, params) => SectionPageWidget(),
        ),
        FFRoute(
          name: RewardPageWidget.routeName,
          path: RewardPageWidget.routePath,
          builder: (context, params) => RewardPageWidget(),
        ),
        FFRoute(
          name: StreakPageWidget.routeName,
          path: StreakPageWidget.routePath,
          builder: (context, params) => StreakPageWidget(),
        ),
        FFRoute(
          name: UserStateListWidget.routeName,
          path: UserStateListWidget.routePath,
          builder: (context, params) => UserStateListWidget(
            countrychosen: params.getParam(
              'countrychosen',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: UserCountryListWidget.routeName,
          path: UserCountryListWidget.routePath,
          builder: (context, params) => UserCountryListWidget(),
        ),
        FFRoute(
          name: UserCollegeListWidget.routeName,
          path: UserCollegeListWidget.routePath,
          builder: (context, params) => UserCollegeListWidget(
            statechosen: params.getParam(
              'statechosen',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ChangeUserYearOfStudyWidget.routeName,
          path: ChangeUserYearOfStudyWidget.routePath,
          builder: (context, params) => ChangeUserYearOfStudyWidget(
            countrychosen: params.getParam(
              'countrychosen',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: UserDetailsWidget.routeName,
          path: UserDetailsWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'User_details')
              : UserDetailsWidget(),
        ),
        FFRoute(
          name: SettingsWidget.routeName,
          path: SettingsWidget.routePath,
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: UserLeaderboardPageWidget.routeName,
          path: UserLeaderboardPageWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'User_Leaderboard_Page')
              : UserLeaderboardPageWidget(),
        ),
        FFRoute(
          name: SignUpSignInwithgoogleappleWidget.routeName,
          path: SignUpSignInwithgoogleappleWidget.routePath,
          builder: (context, params) => SignUpSignInwithgoogleappleWidget(),
        ),
        FFRoute(
          name: QuestCompletionDailyRewardCopyWidget.routeName,
          path: QuestCompletionDailyRewardCopyWidget.routePath,
          builder: (context, params) => QuestCompletionDailyRewardCopyWidget(),
        ),
        FFRoute(
          name: UsernameWidget.routeName,
          path: UsernameWidget.routePath,
          builder: (context, params) => UsernameWidget(),
        ),
        FFRoute(
          name: SomemoredetailsWidget.routeName,
          path: SomemoredetailsWidget.routePath,
          builder: (context, params) => SomemoredetailsWidget(),
        ),
        FFRoute(
          name: LeaderboardconditionalWidget.routeName,
          path: LeaderboardconditionalWidget.routePath,
          builder: (context, params) => LeaderboardconditionalWidget(),
        ),
        FFRoute(
          name: StreakPageCopyWidget.routeName,
          path: StreakPageCopyWidget.routePath,
          builder: (context, params) => StreakPageCopyWidget(),
        ),
        FFRoute(
          name: UserbatchyearWidget.routeName,
          path: UserbatchyearWidget.routePath,
          builder: (context, params) => UserbatchyearWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: ChangeUserCountryWidget.routeName,
          path: ChangeUserCountryWidget.routePath,
          builder: (context, params) => ChangeUserCountryWidget(),
        ),
        FFRoute(
          name: ChangeUserCollegeWidget.routeName,
          path: ChangeUserCollegeWidget.routePath,
          builder: (context, params) => ChangeUserCollegeWidget(
            statechosen: params.getParam(
              'statechosen',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ChangeUserStateWidget.routeName,
          path: ChangeUserStateWidget.routePath,
          builder: (context, params) => ChangeUserStateWidget(
            countrychosen: params.getParam(
              'countrychosen',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: YearOfStudyWidget.routeName,
          path: YearOfStudyWidget.routePath,
          builder: (context, params) => YearOfStudyWidget(
            countrychosen: params.getParam(
              'countrychosen',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: HomePageCopypagestatequeryWidget.routeName,
          path: HomePageCopypagestatequeryWidget.routePath,
          builder: (context, params) => HomePageCopypagestatequeryWidget(),
        ),
        FFRoute(
          name: QuestionPage1CopyWidget.routeName,
          path: QuestionPage1CopyWidget.routePath,
          builder: (context, params) => QuestionPage1CopyWidget(),
        ),
        FFRoute(
          name: UserphonenumberWidget.routeName,
          path: UserphonenumberWidget.routePath,
          builder: (context, params) => UserphonenumberWidget(),
        ),
        FFRoute(
          name: ProfilePictureWidget.routeName,
          path: ProfilePictureWidget.routePath,
          builder: (context, params) => ProfilePictureWidget(),
        ),
        FFRoute(
          name: ConfirmProfilePictureWidget.routeName,
          path: ConfirmProfilePictureWidget.routePath,
          builder: (context, params) => ConfirmProfilePictureWidget(
            profile: params.getParam(
              'profile',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LeaderboardProgressPageWidget.routeName,
          path: LeaderboardProgressPageWidget.routePath,
          builder: (context, params) => LeaderboardProgressPageWidget(),
        ),
        FFRoute(
          name: UserLeaderboardPageCopyWidget.routeName,
          path: UserLeaderboardPageCopyWidget.routePath,
          builder: (context, params) => UserLeaderboardPageCopyWidget(),
        ),
        FFRoute(
          name: TestqueryWidget.routeName,
          path: TestqueryWidget.routePath,
          builder: (context, params) => TestqueryWidget(),
        ),
        FFRoute(
          name: HomePageCopynormalqueryWidget.routeName,
          path: HomePageCopynormalqueryWidget.routePath,
          builder: (context, params) => HomePageCopynormalqueryWidget(),
        ),
        FFRoute(
          name: ChooseCourseWidget.routeName,
          path: ChooseCourseWidget.routePath,
          builder: (context, params) => ChooseCourseWidget(
            countrychosen: params.getParam(
              'countrychosen',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: HomePagNeetPGWidget.routeName,
          path: HomePagNeetPGWidget.routePath,
          builder: (context, params) => HomePagNeetPGWidget(),
        ),
        FFRoute(
          name: QuestionPage1Copy2Widget.routeName,
          path: QuestionPage1Copy2Widget.routePath,
          builder: (context, params) => QuestionPage1Copy2Widget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/signUpSignIn';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Add_a_heading.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
