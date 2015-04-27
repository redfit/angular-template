module.exports = (config) ->
  config.set
    basePath: './'

    plugins : [
      'karma-phantomjs-launcher'
      'karma-chrome-launcher'
      'karma-jasmine'
      'karma-osx-reporter'
      'karma-coverage'
      'karma-coffee-preprocessor'
    ]

    frameworks: ['jasmine']

    files : [
      'app/bower_components/angular/angular.js'
      'app/bower_components/angular-route/angular-route.js'
      'app/bower_components/angular-mocks/angular-mocks.js'
      'app/scripts/**/*.js'
      'spec/**/*.spec.coffee'
    ]

    exclude: [
    ]

    preprocessors:
      'app/scripts/**/*.js': ['coverage']
      'spec/**/*.coffee': ['coffee']

    reporters: ['progress', 'coverage', 'osx']

    port: 9876

    colors: true

    logLevel: config.LOG_INFO

    autoWatch: false

    browsers: ['PhantomJS']

    singleRun: false
