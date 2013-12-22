describe 'AppCtrl', ->

  beforeEach module("nihongo")

  it "should have a dummy test", inject(->
    chai.expect(true).to.be.true
  )
