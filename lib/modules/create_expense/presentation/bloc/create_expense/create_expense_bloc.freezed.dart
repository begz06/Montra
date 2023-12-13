// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_expense_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateExpenseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String price, String desc, bool isExpense)
        createExpense,
    required TResult Function(String image) changeImage,
    required TResult Function(CategoryEnum category) changeCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String price, String desc, bool isExpense)? createExpense,
    TResult? Function(String image)? changeImage,
    TResult? Function(CategoryEnum category)? changeCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String price, String desc, bool isExpense)? createExpense,
    TResult Function(String image)? changeImage,
    TResult Function(CategoryEnum category)? changeCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateExpense value) createExpense,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_ChangeCategory value) changeCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateExpense value)? createExpense,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_ChangeCategory value)? changeCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateExpense value)? createExpense,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_ChangeCategory value)? changeCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateExpenseEventCopyWith<$Res> {
  factory $CreateExpenseEventCopyWith(
          CreateExpenseEvent value, $Res Function(CreateExpenseEvent) then) =
      _$CreateExpenseEventCopyWithImpl<$Res, CreateExpenseEvent>;
}

/// @nodoc
class _$CreateExpenseEventCopyWithImpl<$Res, $Val extends CreateExpenseEvent>
    implements $CreateExpenseEventCopyWith<$Res> {
  _$CreateExpenseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateExpenseImplCopyWith<$Res> {
  factory _$$CreateExpenseImplCopyWith(
          _$CreateExpenseImpl value, $Res Function(_$CreateExpenseImpl) then) =
      __$$CreateExpenseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String price, String desc, bool isExpense});
}

/// @nodoc
class __$$CreateExpenseImplCopyWithImpl<$Res>
    extends _$CreateExpenseEventCopyWithImpl<$Res, _$CreateExpenseImpl>
    implements _$$CreateExpenseImplCopyWith<$Res> {
  __$$CreateExpenseImplCopyWithImpl(
      _$CreateExpenseImpl _value, $Res Function(_$CreateExpenseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? desc = null,
    Object? isExpense = null,
  }) {
    return _then(_$CreateExpenseImpl(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      isExpense: null == isExpense
          ? _value.isExpense
          : isExpense // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CreateExpenseImpl implements _CreateExpense {
  const _$CreateExpenseImpl(
      {required this.price, required this.desc, required this.isExpense});

  @override
  final String price;
  @override
  final String desc;
  @override
  final bool isExpense;

  @override
  String toString() {
    return 'CreateExpenseEvent.createExpense(price: $price, desc: $desc, isExpense: $isExpense)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateExpenseImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.isExpense, isExpense) ||
                other.isExpense == isExpense));
  }

  @override
  int get hashCode => Object.hash(runtimeType, price, desc, isExpense);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateExpenseImplCopyWith<_$CreateExpenseImpl> get copyWith =>
      __$$CreateExpenseImplCopyWithImpl<_$CreateExpenseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String price, String desc, bool isExpense)
        createExpense,
    required TResult Function(String image) changeImage,
    required TResult Function(CategoryEnum category) changeCategory,
  }) {
    return createExpense(price, desc, isExpense);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String price, String desc, bool isExpense)? createExpense,
    TResult? Function(String image)? changeImage,
    TResult? Function(CategoryEnum category)? changeCategory,
  }) {
    return createExpense?.call(price, desc, isExpense);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String price, String desc, bool isExpense)? createExpense,
    TResult Function(String image)? changeImage,
    TResult Function(CategoryEnum category)? changeCategory,
    required TResult orElse(),
  }) {
    if (createExpense != null) {
      return createExpense(price, desc, isExpense);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateExpense value) createExpense,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_ChangeCategory value) changeCategory,
  }) {
    return createExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateExpense value)? createExpense,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_ChangeCategory value)? changeCategory,
  }) {
    return createExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateExpense value)? createExpense,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_ChangeCategory value)? changeCategory,
    required TResult orElse(),
  }) {
    if (createExpense != null) {
      return createExpense(this);
    }
    return orElse();
  }
}

abstract class _CreateExpense implements CreateExpenseEvent {
  const factory _CreateExpense(
      {required final String price,
      required final String desc,
      required final bool isExpense}) = _$CreateExpenseImpl;

  String get price;
  String get desc;
  bool get isExpense;
  @JsonKey(ignore: true)
  _$$CreateExpenseImplCopyWith<_$CreateExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeImageImplCopyWith<$Res> {
  factory _$$ChangeImageImplCopyWith(
          _$ChangeImageImpl value, $Res Function(_$ChangeImageImpl) then) =
      __$$ChangeImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String image});
}

/// @nodoc
class __$$ChangeImageImplCopyWithImpl<$Res>
    extends _$CreateExpenseEventCopyWithImpl<$Res, _$ChangeImageImpl>
    implements _$$ChangeImageImplCopyWith<$Res> {
  __$$ChangeImageImplCopyWithImpl(
      _$ChangeImageImpl _value, $Res Function(_$ChangeImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$ChangeImageImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeImageImpl implements _ChangeImage {
  const _$ChangeImageImpl({required this.image});

  @override
  final String image;

  @override
  String toString() {
    return 'CreateExpenseEvent.changeImage(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeImageImpl &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeImageImplCopyWith<_$ChangeImageImpl> get copyWith =>
      __$$ChangeImageImplCopyWithImpl<_$ChangeImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String price, String desc, bool isExpense)
        createExpense,
    required TResult Function(String image) changeImage,
    required TResult Function(CategoryEnum category) changeCategory,
  }) {
    return changeImage(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String price, String desc, bool isExpense)? createExpense,
    TResult? Function(String image)? changeImage,
    TResult? Function(CategoryEnum category)? changeCategory,
  }) {
    return changeImage?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String price, String desc, bool isExpense)? createExpense,
    TResult Function(String image)? changeImage,
    TResult Function(CategoryEnum category)? changeCategory,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateExpense value) createExpense,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_ChangeCategory value) changeCategory,
  }) {
    return changeImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateExpense value)? createExpense,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_ChangeCategory value)? changeCategory,
  }) {
    return changeImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateExpense value)? createExpense,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_ChangeCategory value)? changeCategory,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage(this);
    }
    return orElse();
  }
}

abstract class _ChangeImage implements CreateExpenseEvent {
  const factory _ChangeImage({required final String image}) = _$ChangeImageImpl;

  String get image;
  @JsonKey(ignore: true)
  _$$ChangeImageImplCopyWith<_$ChangeImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeCategoryImplCopyWith<$Res> {
  factory _$$ChangeCategoryImplCopyWith(_$ChangeCategoryImpl value,
          $Res Function(_$ChangeCategoryImpl) then) =
      __$$ChangeCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryEnum category});
}

/// @nodoc
class __$$ChangeCategoryImplCopyWithImpl<$Res>
    extends _$CreateExpenseEventCopyWithImpl<$Res, _$ChangeCategoryImpl>
    implements _$$ChangeCategoryImplCopyWith<$Res> {
  __$$ChangeCategoryImplCopyWithImpl(
      _$ChangeCategoryImpl _value, $Res Function(_$ChangeCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$ChangeCategoryImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEnum,
    ));
  }
}

/// @nodoc

class _$ChangeCategoryImpl implements _ChangeCategory {
  const _$ChangeCategoryImpl({required this.category});

  @override
  final CategoryEnum category;

  @override
  String toString() {
    return 'CreateExpenseEvent.changeCategory(category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeCategoryImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeCategoryImplCopyWith<_$ChangeCategoryImpl> get copyWith =>
      __$$ChangeCategoryImplCopyWithImpl<_$ChangeCategoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String price, String desc, bool isExpense)
        createExpense,
    required TResult Function(String image) changeImage,
    required TResult Function(CategoryEnum category) changeCategory,
  }) {
    return changeCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String price, String desc, bool isExpense)? createExpense,
    TResult? Function(String image)? changeImage,
    TResult? Function(CategoryEnum category)? changeCategory,
  }) {
    return changeCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String price, String desc, bool isExpense)? createExpense,
    TResult Function(String image)? changeImage,
    TResult Function(CategoryEnum category)? changeCategory,
    required TResult orElse(),
  }) {
    if (changeCategory != null) {
      return changeCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateExpense value) createExpense,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_ChangeCategory value) changeCategory,
  }) {
    return changeCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateExpense value)? createExpense,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_ChangeCategory value)? changeCategory,
  }) {
    return changeCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateExpense value)? createExpense,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_ChangeCategory value)? changeCategory,
    required TResult orElse(),
  }) {
    if (changeCategory != null) {
      return changeCategory(this);
    }
    return orElse();
  }
}

abstract class _ChangeCategory implements CreateExpenseEvent {
  const factory _ChangeCategory({required final CategoryEnum category}) =
      _$ChangeCategoryImpl;

  CategoryEnum get category;
  @JsonKey(ignore: true)
  _$$ChangeCategoryImplCopyWith<_$ChangeCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateExpenseState {
  String get image => throw _privateConstructorUsedError;
  CategoryEnum? get category => throw _privateConstructorUsedError;
  ActionStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateExpenseStateCopyWith<CreateExpenseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateExpenseStateCopyWith<$Res> {
  factory $CreateExpenseStateCopyWith(
          CreateExpenseState value, $Res Function(CreateExpenseState) then) =
      _$CreateExpenseStateCopyWithImpl<$Res, CreateExpenseState>;
  @useResult
  $Res call({String image, CategoryEnum? category, ActionStatus status});
}

/// @nodoc
class _$CreateExpenseStateCopyWithImpl<$Res, $Val extends CreateExpenseState>
    implements $CreateExpenseStateCopyWith<$Res> {
  _$CreateExpenseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? category = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEnum?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ActionStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateExpenseStateImplCopyWith<$Res>
    implements $CreateExpenseStateCopyWith<$Res> {
  factory _$$CreateExpenseStateImplCopyWith(_$CreateExpenseStateImpl value,
          $Res Function(_$CreateExpenseStateImpl) then) =
      __$$CreateExpenseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String image, CategoryEnum? category, ActionStatus status});
}

/// @nodoc
class __$$CreateExpenseStateImplCopyWithImpl<$Res>
    extends _$CreateExpenseStateCopyWithImpl<$Res, _$CreateExpenseStateImpl>
    implements _$$CreateExpenseStateImplCopyWith<$Res> {
  __$$CreateExpenseStateImplCopyWithImpl(_$CreateExpenseStateImpl _value,
      $Res Function(_$CreateExpenseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? category = freezed,
    Object? status = null,
  }) {
    return _then(_$CreateExpenseStateImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEnum?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ActionStatus,
    ));
  }
}

/// @nodoc

class _$CreateExpenseStateImpl implements _CreateExpenseState {
  const _$CreateExpenseStateImpl(
      {this.image = '', this.category, this.status = ActionStatus.pure});

  @override
  @JsonKey()
  final String image;
  @override
  final CategoryEnum? category;
  @override
  @JsonKey()
  final ActionStatus status;

  @override
  String toString() {
    return 'CreateExpenseState(image: $image, category: $category, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateExpenseStateImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, category, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateExpenseStateImplCopyWith<_$CreateExpenseStateImpl> get copyWith =>
      __$$CreateExpenseStateImplCopyWithImpl<_$CreateExpenseStateImpl>(
          this, _$identity);
}

abstract class _CreateExpenseState implements CreateExpenseState {
  const factory _CreateExpenseState(
      {final String image,
      final CategoryEnum? category,
      final ActionStatus status}) = _$CreateExpenseStateImpl;

  @override
  String get image;
  @override
  CategoryEnum? get category;
  @override
  ActionStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$CreateExpenseStateImplCopyWith<_$CreateExpenseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
