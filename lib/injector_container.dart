part of 'injector_container_path.dart';

final GetIt sl = GetIt.instance;
late Box<dynamic> _box;
final Chuck chuck = Chuck(
  navigatorKey: rootNavigatorKey,
  showNotification: true,
);
Future<void> init() async {
  /// External
  await _initHive();

  /// Dio
  sl.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        baseUrl: Constants.baseUrl,
        contentType: "application/json",
        sendTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),

        headers: <String, String>{},
      )
      ..httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final HttpClient client = HttpClient()
            ..badCertificateCallback = (X509Certificate cert, String host, __) {
              log("cert: ${cert.pem}");
              log("host: $host");
              // return cert.pem == certificate;
              return true;
            };
          return client;
        },
        validateCertificate: (X509Certificate? cert, String host, __) {
          log("cert: ${cert?.pem}");
          log("host: $host");
          if (cert == null) {
            return true;
          }
          // Clipboard.setData(ClipboardData(text: cert.pem));
          return true;
          // return cert.pem == certificate;
        },
      )
      ..interceptors.add(
        LogInterceptor(
          error: kDebugMode,
          request: kDebugMode,
          requestBody: kDebugMode,
          responseBody: kDebugMode,
          requestHeader: kDebugMode,
          responseHeader: kDebugMode,
          logPrint: (Object object) {
            if (kDebugMode) {
              log("dio: $object");
            }
          },
        ),
      ),
  );

  sl<Dio>().interceptors.addAll(<Interceptor>[
    chuck.dioInterceptor,
    AuthTokenInterceptor(dio: sl<Dio>()),
    RetryInterceptor(
      dio: sl<Dio>(),
      retries: 0,

      toNoInternetPageNavigator: () async {
        final RouteMatch lastMatch =
            router.routerDelegate.currentConfiguration.last;
        final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
            ? lastMatch.matches
            : router.routerDelegate.currentConfiguration;
        final String location = matchList.uri.toString();
        if (location.contains("")) {
          return;
        }
        await router.pushNamed("/");
      },
      accessTokenGetter: () => "Bearer ${localSource.accessToken}",

      refreshTokenFunction: () async {
        /* log("🔄 Attempting token refresh...");
        final result = await sl<RefreshUseCase>().call(
          RefreshTokenParams(refreshToken: localSource.refreshToken),
        );
        result.either(
          (failure) async {
            log("❌ Refresh token failed: ${failure.message}");
            // Check if it's an invalid signature error (old token with new secret)
            if (failure.message.toLowerCase().contains('invalid signature') ||
                failure.message.toLowerCase().contains('jwt') ||
                failure.message.toLowerCase().contains('token')) {
              log(
                "🧹 Detected invalid/old token, clearing all tokens immediately",
              );
            }
            await localSource.clear().then((_) {
              log("✅ Tokens cleared, redirecting to initial page");
              router.goNamed(Routes.initial);
            });
          },
          (value) async {
            await localSource.setAccessToken(value.tokens.accessToken);
            await localSource.setRefreshToken(value.tokens.refreshToken);
            await localSource.setUserId(value.user.id);
            log("✅ Token refreshed successfully");
          },
        );*/
      },
      forbiddenFunction: () async {
        await localSource.clear().then((_) {
          router.goNamed(Routes.initial);
        });
      },
      logPrint: (String message) {
        if (kDebugMode) {
          log("dio: $message");
        }
      },
    ),
  ]);

  /// Core
  sl
    ..registerSingleton<LocalSource>(LocalSource(_box))
    ..registerLazySingleton(
      () => InternetConnectionChecker.createInstance(
        checkInterval: const Duration(seconds: 3),
      ),
    )
    ..registerSingletonAsync<PackageInfo>(PackageInfo.fromPlatform)
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  _dataSources();
  _repositories();
  _useCase();
  _cubit();
  _bloc();
}

void _dataSources() {
  /// Auth
  /* sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(dio: sl(), localSource: sl()),
  );*/
}

void _repositories() {
  /// Auth
  /*sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authDataSource: sl()),
  );*/
}

void _useCase() {
  /// Auth
  /*  sl.registerLazySingleton<SendSmsUseCase>(
    () => SendSmsUseCase(authRepository: sl()),
  );*/
}

void _cubit() {
  /*sl.registerFactory<AboutAppCubit>(() => AboutAppCubit());*/
}

void _bloc() {
  ///intial
  /*  sl.registerFactory<SplashBloc>(() => SplashBloc(localSource: sl()));*/
}

Future<void> _initHive() async {
  const String boxName = "corporate_threat_detection_box";

  if (kIsWeb) {
    // Web platform uses IndexedDB, no path required
    Hive.init('');
  } else {
    // Mobile/Desktop platforms use file system
    final Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  _box = await Hive.openBox<dynamic>(boxName);
}
