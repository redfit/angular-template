exports.config =
  seleniumServerJar: require('gulp-selenium')().path

  specs: ['e2e/**/*.spec.coffee']

  capabilities:
    'browserName': 'phantomjs'
    'phantomjs.binary.path': require('phantomjs').path
    'phantomjs.ghostdriver.cli.args': ['--loglevel=DEBUG']

  baseUrl: 'http://localhost:8080'
