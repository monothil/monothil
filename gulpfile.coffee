gulp = require 'gulp'
typescript = require 'gulp-tsc'

paths = {
  scripts: 'src/typescript/**/*.ts'
  dest: 'grails-app/assets/javascripts'
}

gulp.task 'default', ['watch']

gulp.task 'compile', ->
  gulp.src paths.scripts
    .pipe(typescript { emitError: false })
    .pipe(gulp.dest paths.dest)

gulp.task 'watch', ->
  gulp.watch paths.scripts, ['compile']
