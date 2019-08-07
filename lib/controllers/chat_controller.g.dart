// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$ChatController on _AbstractChatController, Store {
  final _$socketConnectedAtom =
      Atom(name: '_AbstractChatController.socketConnected');

  @override
  bool get socketConnected {
    _$socketConnectedAtom.context.enforceReadPolicy(_$socketConnectedAtom);
    _$socketConnectedAtom.reportObserved();
    return super.socketConnected;
  }

  @override
  set socketConnected(bool value) {
    _$socketConnectedAtom.context.conditionallyRunInAction(() {
      super.socketConnected = value;
      _$socketConnectedAtom.reportChanged();
    }, _$socketConnectedAtom, name: '${_$socketConnectedAtom.name}_set');
  }

  final _$socketConnectingAtom =
      Atom(name: '_AbstractChatController.socketConnecting');

  @override
  bool get socketConnecting {
    _$socketConnectingAtom.context.enforceReadPolicy(_$socketConnectingAtom);
    _$socketConnectingAtom.reportObserved();
    return super.socketConnecting;
  }

  @override
  set socketConnecting(bool value) {
    _$socketConnectingAtom.context.conditionallyRunInAction(() {
      super.socketConnecting = value;
      _$socketConnectingAtom.reportChanged();
    }, _$socketConnectingAtom, name: '${_$socketConnectingAtom.name}_set');
  }

  final _$oneAtom = Atom(name: '_AbstractChatController.one');

  @override
  ThemeData get one {
    _$oneAtom.context.enforceReadPolicy(_$oneAtom);
    _$oneAtom.reportObserved();
    return super.one;
  }

  @override
  set one(ThemeData value) {
    _$oneAtom.context.conditionallyRunInAction(() {
      super.one = value;
      _$oneAtom.reportChanged();
    }, _$oneAtom, name: '${_$oneAtom.name}_set');
  }

  final _$twoAtom = Atom(name: '_AbstractChatController.two');

  @override
  ThemeData get two {
    _$twoAtom.context.enforceReadPolicy(_$twoAtom);
    _$twoAtom.reportObserved();
    return super.two;
  }

  @override
  set two(ThemeData value) {
    _$twoAtom.context.conditionallyRunInAction(() {
      super.two = value;
      _$twoAtom.reportChanged();
    }, _$twoAtom, name: '${_$twoAtom.name}_set');
  }

  final _$membersAtom = Atom(name: '_AbstractChatController.members');

  @override
  ObservableList<String> get members {
    _$membersAtom.context.enforceReadPolicy(_$membersAtom);
    _$membersAtom.reportObserved();
    return super.members;
  }

  @override
  set members(ObservableList<String> value) {
    _$membersAtom.context.conditionallyRunInAction(() {
      super.members = value;
      _$membersAtom.reportChanged();
    }, _$membersAtom, name: '${_$membersAtom.name}_set');
  }

  final _$socketAtom = Atom(name: '_AbstractChatController.socket');

  @override
  Socket get socket {
    _$socketAtom.context.enforceReadPolicy(_$socketAtom);
    _$socketAtom.reportObserved();
    return super.socket;
  }

  @override
  set socket(Socket value) {
    _$socketAtom.context.conditionallyRunInAction(() {
      super.socket = value;
      _$socketAtom.reportChanged();
    }, _$socketAtom, name: '${_$socketAtom.name}_set');
  }

  final _$enteredChatAtom = Atom(name: '_AbstractChatController.enteredChat');

  @override
  bool get enteredChat {
    _$enteredChatAtom.context.enforceReadPolicy(_$enteredChatAtom);
    _$enteredChatAtom.reportObserved();
    return super.enteredChat;
  }

  @override
  set enteredChat(bool value) {
    _$enteredChatAtom.context.conditionallyRunInAction(() {
      super.enteredChat = value;
      _$enteredChatAtom.reportChanged();
    }, _$enteredChatAtom, name: '${_$enteredChatAtom.name}_set');
  }

  final _$messagesAtom = Atom(name: '_AbstractChatController.messages');

  @override
  ObservableList<Message> get messages {
    _$messagesAtom.context.enforceReadPolicy(_$messagesAtom);
    _$messagesAtom.reportObserved();
    return super.messages;
  }

  @override
  set messages(ObservableList<Message> value) {
    _$messagesAtom.context.conditionallyRunInAction(() {
      super.messages = value;
      _$messagesAtom.reportChanged();
    }, _$messagesAtom, name: '${_$messagesAtom.name}_set');
  }

  final _$connectionErrorAtom =
      Atom(name: '_AbstractChatController.connectionError');

  @override
  String get connectionError {
    _$connectionErrorAtom.context.enforceReadPolicy(_$connectionErrorAtom);
    _$connectionErrorAtom.reportObserved();
    return super.connectionError;
  }

  @override
  set connectionError(String value) {
    _$connectionErrorAtom.context.conditionallyRunInAction(() {
      super.connectionError = value;
      _$connectionErrorAtom.reportChanged();
    }, _$connectionErrorAtom, name: '${_$connectionErrorAtom.name}_set');
  }

  final _$startConnectAsyncAction = AsyncAction('startConnect');

  @override
  Future startConnect() {
    return _$startConnectAsyncAction.run(() => super.startConnect());
  }

  final _$_AbstractChatControllerActionController =
      ActionController(name: '_AbstractChatController');

  @override
  dynamic notifyChange() {
    final _$actionInfo =
        _$_AbstractChatControllerActionController.startAction();
    try {
      return super.notifyChange();
    } finally {
      _$_AbstractChatControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _handleData(List<int> data) {
    final _$actionInfo =
        _$_AbstractChatControllerActionController.startAction();
    try {
      return super._handleData(data);
    } finally {
      _$_AbstractChatControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sendMessage(String data) {
    final _$actionInfo =
        _$_AbstractChatControllerActionController.startAction();
    try {
      return super.sendMessage(data);
    } finally {
      _$_AbstractChatControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sendHello(String name) {
    final _$actionInfo =
        _$_AbstractChatControllerActionController.startAction();
    try {
      return super.sendHello(name);
    } finally {
      _$_AbstractChatControllerActionController.endAction(_$actionInfo);
    }
  }
}
