
modules = [
  'templates',

  'nihongo.kana',

  'ui.router.state'
]

appModule = angular.module('nihongo', modules)

appModule.config(['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/hiragana'
])
