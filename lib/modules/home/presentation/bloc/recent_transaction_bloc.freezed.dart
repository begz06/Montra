// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_transaction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecentTransactionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTransactions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTransaction value) getTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTransaction value)? getTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTransaction value)? getTransactions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentTransactionEventCopyWith<$Res> {
  factory $RecentTransactionEventCopyWith(RecentTransactionEvent value,
          $Res Function(RecentTransactionEvent) then) =
      _$RecentTransactionEventCopyWithImpl<$Res, RecentTransactionEvent>;
}

/// @nodoc
class _$RecentTransactionEventCopyWithImpl<$Res,
        $Val extends RecentTransactionEvent>
    implements $RecentTransactionEventCopyWith<$Res> {
  _$RecentTransactionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetTransactionImplCopyWith<$Res> {
  factory _$$GetTransactionImplCopyWith(_$GetTransactionImpl value,
          $Res Function(_$GetTransactionImpl) then) =
      __$$GetTransactionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTransactionImplCopyWithImpl<$Res>
    extends _$RecentTransactionEventCopyWithImpl<$Res, _$GetTransactionImpl>
    implements _$$GetTransactionImplCopyWith<$Res> {
  __$$GetTransactionImplCopyWithImpl(
      _$GetTransactionImpl _value, $Res Function(_$GetTransactionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetTransactionImpl implements _GetTransaction {
  const _$GetTransactionImpl();

  @override
  String toString() {
    return 'RecentTransactionEvent.getTransactions()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetTransactionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTransactions,
  }) {
    return getTransactions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTransactions,
  }) {
    return getTransactions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTransactions,
    required TResult orElse(),
  }) {
    if (getTransactions != null) {
      return getTransactions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTransaction value) getTransactions,
  }) {
    return getTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTransaction value)? getTransactions,
  }) {
    return getTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTransaction value)? getTransactions,
    required TResult orElse(),
  }) {
    if (getTransactions != null) {
      return getTransactions(this);
    }
    return orElse();
  }
}

abstract class _GetTransaction implements RecentTransactionEvent {
  const factory _GetTransaction() = _$GetTransactionImpl;
}

/// @nodoc
mixin _$RecentTransactionState {
  List<TransactionModel> get list => throw _privateConstructorUsedError;
  ActionStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecentTransactionStateCopyWith<RecentTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentTransactionStateCopyWith<$Res> {
  factory $RecentTransactionStateCopyWith(RecentTransactionState value,
          $Res Function(RecentTransactionState) then) =
      _$RecentTransactionStateCopyWithImpl<$Res, RecentTransactionState>;
  @useResult
  $Res call({List<TransactionModel> list, ActionStatus status});
}

/// @nodoc
class _$RecentTransactionStateCopyWithImpl<$Res,
        $Val extends RecentTransactionState>
    implements $RecentTransactionStateCopyWith<$Res> {
  _$RecentTransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ActionStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentTransactionStateImplCopyWith<$Res>
    implements $RecentTransactionStateCopyWith<$Res> {
  factory _$$RecentTransactionStateImplCopyWith(
          _$RecentTransactionStateImpl value,
          $Res Function(_$RecentTransactionStateImpl) then) =
      __$$RecentTransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TransactionModel> list, ActionStatus status});
}

/// @nodoc
class __$$RecentTransactionStateImplCopyWithImpl<$Res>
    extends _$RecentTransactionStateCopyWithImpl<$Res,
        _$RecentTransactionStateImpl>
    implements _$$RecentTransactionStateImplCopyWith<$Res> {
  __$$RecentTransactionStateImplCopyWithImpl(
      _$RecentTransactionStateImpl _value,
      $Res Function(_$RecentTransactionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? status = null,
  }) {
    return _then(_$RecentTransactionStateImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ActionStatus,
    ));
  }
}

/// @nodoc

class _$RecentTransactionStateImpl implements _RecentTransactionState {
  const _$RecentTransactionStateImpl(
      {final List<TransactionModel> list = const [],
      this.status = ActionStatus.pure})
      : _list = list;

  final List<TransactionModel> _list;
  @override
  @JsonKey()
  List<TransactionModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  @JsonKey()
  final ActionStatus status;

  @override
  String toString() {
    return 'RecentTransactionState(list: $list, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentTransactionStateImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentTransactionStateImplCopyWith<_$RecentTransactionStateImpl>
      get copyWith => __$$RecentTransactionStateImplCopyWithImpl<
          _$RecentTransactionStateImpl>(this, _$identity);
}

abstract class _RecentTransactionState implements RecentTransactionState {
  const factory _RecentTransactionState(
      {final List<TransactionModel> list,
      final ActionStatus status}) = _$RecentTransactionStateImpl;

  @override
  List<TransactionModel> get list;
  @override
  ActionStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$RecentTransactionStateImplCopyWith<_$RecentTransactionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
