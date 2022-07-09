import 'package:coco_explorer/core/domain/entities/failures.dart';
import 'package:coco_explorer/core/domain/usecases/usecase.dart';
import 'package:coco_explorer/features/auth/domain/entities/user.dart';
import 'package:coco_explorer/features/auth/domain/usecases/get_first_time_logged_use_case.dart';
import 'package:coco_explorer/features/auth/domain/usecases/get_signed_in_user_use_case.dart';
import 'package:coco_explorer/features/auth/domain/usecases/logout_use_case.dart';
import 'package:coco_explorer/features/auth/domain/usecases/set_first_time_logged_use_case.dart';
import 'package:coco_explorer/features/auth/domain/usecases/subscribe_to_auth_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetSignedInUserUseCase getSignedInUser;
  final LogoutUseCase logoutUseCase;
  final GetFirstTimeLoggedUseCase getFirstTimeLogged;
  final SetFirstTimeLoggedUseCase setFirstTimeLogged;
  final SubscribeToAuthStatusUseCase subscribeToAuthStatusUseCase;

  AuthBloc(
      this.getSignedInUser,
      this.logoutUseCase,
      this.getFirstTimeLogged,
      this.setFirstTimeLogged,
      this.subscribeToAuthStatusUseCase,
      )
      : super(AuthInitial()) {
    on<AuthSetFirstTimeLogged>(
      (event, emit) {
        setFirstTimeLogged(SetFirstTimeLoggedUseCaseParams(
            isFirstTimeLogged: event.isFirstTimeLogged));
      },
    );
    on<AuthCheckRequested>(
      (event, emit) async {
        emit(AuthLoading());
        final result = await getSignedInUser.call(NoParams());
        final result2 = await getFirstTimeLogged(NoParams());
        await result.fold((failure) {
          emit(AuthFailure(failure));
        }, (user) async {
          if (user != null) {
            emit(
              Authenticated(
                user: user,
                // devicesPermissions: devicesPermissions,
              ),
            );
          } else {
            return result2.fold(
                (l) => emit(AuthFailure(l)), (r) => emit(Unauthenticated(r)));
          }
        });
      },
    );
    on<AuthLogin>((event, emit) async {
      emit(AuthLoading());
      emit(
        Authenticated(
          user: event.user,
          // devicesPermissions: devicesPermissions,
        ),
      );
    });
    on<AuthLogout>(
      (event, emit) async {
        logoutUseCase.call(NoParams());
      },
    );

    on<AuthEmitFailure>(
      (event, emit) async {
        emit(AuthFailure(event.failure));
      },
    );

    on<SubscribeToAuthStatus>((event, emit) async {
      final result = await subscribeToAuthStatusUseCase.call(NoParams());
      await result.fold(
        (l) => null,
        (authStatus) async {
          await emit.onEach<User?>(
            authStatus,
            onData: (user) {
              if (user == null) {
                emit(Unauthenticated(false));
              } else {
                if (state is Authenticated) {
                  emit(
                    Authenticated(
                      user: user,
                    ),
                  );
                } else {
                  add(AuthLogin(user));
                }
              }
            },
          );
        },
      );
    },);
  }
}
