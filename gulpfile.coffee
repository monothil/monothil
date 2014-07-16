gulp = require 'gulp'
bowerFiles = require 'main-bower-files'
typescript = require 'gulp-tsc'

paths = {
  scripts: 'src/typescript/**/*.ts'
  dest: 'grails-app/assets/javascripts'
  vendorDest: 'grails-app/assets/vendor'
}

gulp.task 'default', ['watch']

gulp.task 'bower', ->
  gulp.src bowerFiles()
    .pipe(gulp.dest paths.vendorDest)

gulp.task 'compile', ->
  gulp.src paths.scripts
    .pipe(typescript { emitError: false })
    .pipe(gulp.dest paths.dest)

gulp.task 'watch', ->
  gulp.watch paths.scripts, ['compile']
