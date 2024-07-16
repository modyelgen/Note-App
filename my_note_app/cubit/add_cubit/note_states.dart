abstract class AddNoteStates{}

class InitialAddNoteStates extends AddNoteStates {}

class LoadingAddNoteStates extends AddNoteStates {}

class SuccessAddNoteStates extends AddNoteStates {}

class FailedAddNoteStates extends AddNoteStates {
  final String errMessage;
  FailedAddNoteStates(this.errMessage);
}