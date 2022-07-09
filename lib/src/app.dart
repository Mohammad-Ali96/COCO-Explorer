import 'package:coco_explorer/core/presentation/resources/app_color_scheme.dart';
import 'package:coco_explorer/core/presentation/resources/app_theme.dart';
import 'package:coco_explorer/injection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:coco_explorer/core/presentation/routes/app_router.dart' as router;

import '../core/presentation/blocs/auth/auth_bloc.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = router.AppRouter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) =>
            getIt<AuthBloc>()..add(SubscribeToAuthStatus()),
          ),
        ],
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, c) {
              SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle.light);
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'COCO Explorer',
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: AppTheme(AppLightColorScheme()).getThemeData(context),
                darkTheme:
                AppTheme(AppDarkColorScheme()).getThemeData(context),
                themeMode: ThemeMode.light,
                builder: (context, widget) {
                  return MultiBlocListener(
                    listeners: [
                      BlocListener<AuthBloc, AuthState>(
                        listenWhen: (s1, s2) =>
                        s1.runtimeType != s2.runtimeType,
                        listener: (context, state) async {
                          if (state is Authenticated) {
                            // TODO
//                            _appRouter.pushAndPopUntil(
//                                const router.HomePageRoute(),
//                                predicate: (route) => false);
                          }
                          if (state is Unauthenticated) {
                            if (state.isFirstTimeLogged) {
                              // TODO
//                              _appRouter.pushAndPopUntil(
//                                const OnBoardingPageRoute(),
//                                predicate: (r) => false,
//                              );
                            } else {
                              // TODO
//                              _appRouter.pushAndPopUntil(
//                                const LoginPageRoute(),
//                                predicate: (r) => false,
//                              );
                            }
                          }
                        },
                      ),
                    ],
                    child: Builder(builder: (context) {
                      if (widget == null) {
                        return Container();
                      }
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: ScrollConfiguration(
                          behavior: const ScrollBehavior().copyWith(
                            physics: const BouncingScrollPhysics(),
                          ),
                          child: SafeArea(
                            top: false,
                            left: false,
                            right: false,
                            child: widget,
                          ),
                        ),
                      );
                    }),
                  );
                },
                routerDelegate: _appRouter.delegate(),
                routeInformationParser: _appRouter.defaultRouteParser(),
              );
            }));
  }
}
