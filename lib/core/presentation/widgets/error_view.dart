import 'package:coco_explorer/core/domain/entities/failures.dart';
import 'package:coco_explorer/core/domain/utils/constants.dart';
import 'package:coco_explorer/core/presentation/blocs/auth/auth_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorView extends StatelessWidget {
  final String? message;
  final Function? onRetry;
  final Failure? failure;
  final Map<ServerErrorCode, String>? customMessages;

  const ErrorView({
    Key? key,
    this.message,
    this.onRetry,
    this.failure,
    this.customMessages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            _getErrorMessage,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        if (onRetry != null ||
            (failure != null &&
                failure is ServerFailure &&
                (failure as ServerFailure?)!.errorCode ==
                    ServerErrorCode.unauthenticated)) ...[
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                if (failure != null &&
                    failure is ServerFailure &&
                    (failure as ServerFailure?)!.errorCode ==
                        ServerErrorCode.unauthenticated) {
                  BlocProvider.of<AuthBloc>(context).add(AuthLogout());

                } else {
                  onRetry!();
                }
              },
              child: Text(_getActionText))
        ]
      ],
    );
  }

  String get _getErrorMessage {
    String errorMessage = 'error_message'.tr();

    if (failure != null && failure is ServerFailure) {
      if (failure is ServerFailure) {
        if ((failure as ServerFailure?)!.errorCode ==
            ServerErrorCode.noInternetConnection) {
          errorMessage = 'no_internet_connection_message'.tr();
        } else if ((failure as ServerFailure?)!.errorCode ==
            ServerErrorCode.forbidden) {
          errorMessage = 'access_denied_message'.tr();
        } else if ((failure as ServerFailure?)!.message.isNotEmpty) {
          errorMessage = (failure as ServerFailure?)!.message;
        } else if ((failure as ServerFailure?)!.errorCode ==
            ServerErrorCode.unauthenticated) {
          errorMessage = 'unauthenticated_message'.tr();
        } else if (customMessages != null && customMessages!.isNotEmpty) {
          errorMessage =
              customMessages![(failure as ServerFailure?)!.errorCode]!;
        }
      } else if (failure is LogicFailure) {
        if ((failure as LogicFailure?)!.message.isNotEmpty) {
          errorMessage = (failure as LogicFailure?)!.message;
        }
      }
    } else if (message != null) {
      errorMessage = message!;
    }
    return errorMessage;
  }

  String get _getActionText {
    String actionText = 'retry'.tr();

    if (failure != null && failure is ServerFailure) {
      if ((failure as ServerFailure?)!.errorCode ==
          ServerErrorCode.unauthenticated) {
        actionText = 'login'.tr();
      }
    }

    return actionText;
  }
}
