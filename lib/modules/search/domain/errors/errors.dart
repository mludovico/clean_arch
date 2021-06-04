abstract class IFailureSearch implements Exception {}

class InvalidTextError implements IFailureSearch {}

class DatasourceError implements IFailureSearch {}
