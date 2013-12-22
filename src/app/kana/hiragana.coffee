
modules = [
  'kana.service'
]

hiragana = angular.module 'kana.hiragana', modules

hiragana.controller 'HiraganaCtrl', ['$scope', 'kanaService', ($scope, kanaService) ->
  $scope.question = kanaService.getHiraganaQuestion()
  $scope.score =
    right: 0
    wrong: 0

  $scope.checkAnswer = () ->
    if $scope.answer
      if $scope.answer is $scope.question.kana or $scope.answer is $scope.question.answer
        # Do animation and stuff
        $scope.score.right += 1
        $scope.mistake = undefined
      else
        $scope.score.wrong += 1
        $scope.mistake =
          entered: $scope.answer
          question: $scope.question.kana
          answer: $scope.question.answer

      $scope.answer = ''
      $scope.question = kanaService.getHiraganaQuestion()
]