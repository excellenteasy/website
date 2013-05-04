module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-compress'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-shell'

  grunt.initConfig
    clean:
      build: ['build']

    copy:
      build:
        files: [
          { expand: on, cwd: 'src/img/', src: ['sprites.png', 'sprites@2x.png'], dest: 'build/img' }
          { expand: on, cwd: 'src/img/', src: ['favicon.ico'], dest: 'build' }
          'build/robots.txt': 'src/robots.txt'
          'build/sitemap.xml': 'src/sitemap.xml'
        ]
      blog:
        files: [
          { expand: on, cwd: 'src/blog/_site/', src: ['**'], dest: 'build/blog'}
        ]

    less:
      build:
        options:
          yuicompress: on
          optimization: 1
        files: [
          'build/css/main.css': 'src/less/main.less'
        ]

    jade:
      build:
        files: [
          'build/index.html': 'src/jade/index.jade'
          'build/contact/index.html': 'src/jade/contact/index.jade'
          'build/legal/index.html': 'src/jade/legal/index.jade'
        ]

    compress:
      build:
        options: mode: 'gzip'
        files: [
          { expand: on, cwd: 'build/', src: ['**/*.html','**/*.css'], dest: 'build' }
        ]

    shell:
      jekyll:
        command: 'cd src/blog; jekyll;'
        stdout: on
        stderr: on
        failOnError: on

    watch:
      img:
        files: ['src/img/**/*']
        tasks: ['copy:build']
      less:
        files: ['src/less/**/*']
        tasks: ['less:build']
      jade:
        files: ['src/jade/**/*']
        tasks: ['jade:build']
      jekyll:
        files: ['src/blog/**/*']
        tasks: ['shell:jekyll']

  grunt.registerTask 'build', [
    'clean:build'
    'copy:build'
    'less:build'
    'jade:build'
    'shell:jekyll'
    'compress:build'
    'copy:blog'
  ]
  grunt.registerTask 'default', [
    'build'
    'watch'
  ]
