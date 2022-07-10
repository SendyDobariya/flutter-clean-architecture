abstract class BaseEvent {}

class LoadingEvent extends BaseEvent {}

class NoDataEvent extends BaseEvent {}

class ServerErrorEvent extends BaseEvent {}

class CacheErrorEvent extends BaseEvent {}

class SometingWentWrongEvent extends BaseEvent {}
