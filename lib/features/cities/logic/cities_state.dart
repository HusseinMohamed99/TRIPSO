import 'package:freezed_annotation/freezed_annotation.dart';

part 'cities_state.freezed.dart';

@freezed
class CitiesStates with _$CitiesStates {
  /// Initial state
  const factory CitiesStates.initial() = CitiesInitialState;

  /// Loading state
  const factory CitiesStates.loading() = CitiesLoadingState;

  /// Success state
  const factory CitiesStates.success() = CitiesSuccessState;

  /// Error state with a message
  const factory CitiesStates.error(String error) = CitiesErrorState;

  /// Exception state with a message
  const factory CitiesStates.exception(String error) = CitiesExceptionState;
}
