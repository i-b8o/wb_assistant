part of 'supplies_bloc.dart';

@immutable
abstract class SuppliesEvent {}

class ExpandOrCollapseBtnPressed extends SuppliesEvent {
  final int index;

  ExpandOrCollapseBtnPressed(this.index);
}
