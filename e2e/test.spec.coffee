describe "hello-protractor", ->
  describe "index", ->
    it "should display the correct title", ->
      # in the vide, I used the protractor.getInstance() which was removed shortly thereafter in favor of this browser approach
      browser.get('/')
      expect(browser.getTitle()).toBe('angular template')
