
modules = [
  'templates',

  'nihongo.kana',

  'ui.router.state',
  'countdown'
]

appModule = angular.module('nihongo', modules)

appModule.config(['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/hiragana'
])

appModule.controller 'AppCtrl', ['$scope', '$location', ($scope, $location) ->
  $scope.$on '$stateChangeSuccess', (
    event, toState, toParams, fromState, fromParams
  ) ->
    if angular.isDefined(toState.data.pageTitle)
      $scope.pageTitle = toState.data.pageTitle

    $scope.currentTab = toState.name
]