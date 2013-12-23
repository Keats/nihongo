
modules = [
  'ui.router.state',

  'kana.controller'
]

home = angular.module 'nihongo.kana', modules

home.config ['$stateProvider', ($stateProvider) ->
  $stateProvider.state 'hiragana',
    url: '/hiragana'
    controller: 'KanaCtrl'
    templateUrl: 'kana/index.html'
    data:
      pageTitle: 'Hiragana'

  $stateProvider.state 'katakana',
    url: '/katakana'
    controller: 'KanaCtrl'
    templateUrl: 'kana/index.html'
    data:
      pageTitle: 'Katakana'
]
