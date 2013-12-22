
modules = [
  'kana.service'
]

hiragana = angular.module 'kana.hiragana', modules

hiragana.controller 'HiraganaCtrl', ['$scope', 'kanaService', ($scope, kanaService) ->
  $scope.question = kanaService.getHiraganaQuestion()

  $scope.checkAnswer = () ->
    if $scope.answer
      result = $scope.answer is $scope.question.kana or $scope.answer is $scope.question.answer
      console.log result
]