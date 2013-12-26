describe "Directives: countdown", ->
  element = undefined
  scope = undefined
  rootScope = undefined

  beforeEach module("countdown")

  beforeEach inject(($rootScope, $compile) ->
    rootScope = $rootScope
    scope = $rootScope.$new()
    element = angular.element '<countdown start="5"></countdown>'
    $compile(element)(scope)
    scope.$digest()
  )

  it 'should display the right template', ->
    insideTemplate = element.find 'div'
    expect(insideTemplate).to.have.length 1
    expect(insideTemplate[0].outerHTML).to.equal '<div class="countdown ng-binding">5</div>'

  it 'should tick down every second', inject(($interval) ->
    expect(scope.countdown).to.equal 5
    $interval.flush 1000
    expect(scope.countdown).to.equal 4
  )

  it 'should broadcast that the countdown is over', inject(($interval) ->
    broadcastStub = sinon.stub(rootScope, '$broadcast')
    expect(scope.countdown).to.equal 5
    $interval.flush 5000
    expect(broadcastStub.called).to.be.ok
  )

  it 'should stop when the coutdown:stop event is emitted', inject(($interval) ->
    expect(scope.countdown).to.equal 5
    $interval.flush 1000
    expect(scope.countdown).to.equal 4

    scope.$emit 'countdown:stop'
    $interval.flush 1000
    expect(scope.countdown).to.equal 4
  )

  it 'should restart when the coutdown:restart event is emitted', inject(($interval) ->
    expect(scope.countdown).to.equal 5
    $interval.flush 1000
    expect(scope.countdown).to.equal 4

    scope.$emit 'countdown:restart'
    expect(scope.countdown).to.equal 5
  )
