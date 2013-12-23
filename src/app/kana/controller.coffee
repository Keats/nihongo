
modules = [
  'kana.service'
]

kana = angular.module 'kana.controller', modules

kana.controller 'KanaCtrl', ['$scope', '$state', 'kanaService', ($scope, $state, kanaService) ->
  $scope.question = kanaService.getQuestion($state.current.name)
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
      $scope.question = kanaService.getQuestion($state.current.name)
]