getImageFilesArray = (width) ->
  [
    expand: on
    cwd: 'src/blog/_images'
    src: ['*']
    dest: 'build/blog/images'
    rename: (destBase, destPath) ->
      ext = destPath.match /\.[0-9a-z]+$/i
      dest = destPath.replace /\.[0-9a-z]+$/i, "_#{width}#{ext}"
      dest = destBase+'/'+dest
  ]

module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-compress'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-image-resize'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-concat'

  grunt.initConfig
    jekyllConfig: grunt.file.readYAML 'src/blog/_config.yml'

    clean:
      build: ['build', 'excellenteasy.com', 's3', 'tmp']
      images: ['src/blog/_images']

    connect:
      server:
        options:
          hostname: '*'
          port: 1337
          base: 'build'
          open: yes

    image_resize:
      full:
        options:
          width: 660
          overwrite: no
        files: getImageFilesArray 660
      mid:
        options:
          width: 470
          overwrite: no
        files: getImageFilesArray 470
      iphone:
        options:
          width: 280
          overwrite: no
        files: getImageFilesArray 280
      low:
        options:
          width: 150
          overwrite: no
        files: getImageFilesArray 150

    imagemin:
      src:
        options:
          optimizationLevel: 7
        files: [
          expand: on
          cwd: 'src/blog/_images'
          src: ['*']
          dest: 'src/blog/_images'
        ]
      dist:
        options:
          optimizationLevel: 7
        files: [
          expand: on
          cwd: 'build/blog/images'
          src: ['*']
          dest: 'build/blog/images'
        ]

    copy:
      build:
        files: [
          { expand: on, cwd: 'src/website/img/', src: ['sprites.png', 'sprites@2x.png', 'mobile_devices.png', 'ng_logo.png', 'ee_logo.png'], dest: 'build/img' },
          { expand: on, cwd: 'src/website/img/avatars', src: ['*'], dest: 'build/img/avatars'},
          'build/favicon.ico': 'src/website/favicon.ico'
          'build/robots.txt': 'src/website/robots.txt'
          'build/sitemap.xml': 'src/website/sitemap.xml'
          'build/google90ce62b7f18d4018.html': 'src/website/google90ce62b7f18d4018.html'
        ]
      dist:
        files: [
          'excellenteasy.com/favicon.ico': 'build/favicon.ico'
          'excellenteasy.com/angular.ico': 'build/angular-mobile-newsletter/favicon.ico'
        ,
          expand: on
          cwd: 'build/'
          src: ['**/*.html','**/*.xml','**/*.json', '**/*.txt']
          dest: 'excellenteasy.com'
        ]
      images:
        files: [
          expand: on
          cwd: 'src/blog/_images'
          src: ['**/*']
          dest: 'src/blog/_images_uploaded'
        ]
      jekyll:
        files: [
          expand: on
          cwd: 'tmp'
          src: ['**/*']
          dest: 'build'
        ]

    cssmin:
      blog:
        files: [
          "build/assets/css/<%= jekyllConfig.css %>.css": 'build/assets/css/style.css'
          "build/assets/css/<%= jekyllConfig.devcss %>.css": 'build/assets/css/devstyle.css'
          'build/assets/css/search-2.css': 'build/assets/css/search.css'
        ]

    concat:
      options:
        separator: ';'
      build:
        dest: "build/assets/js/<%= jekyllConfig.js %>.js"
        src: [
          'src/blog/assets/_js/jquery.min.js'
          'src/blog/assets/_js/jquery.unveil.min.js'
          'src/blog/assets/_js/enquire.js'
          'src/blog/assets/_js/custom.js'
        ]
      search:
        dest: 'build/assets/js/search-4.js'
        src: [
          'src/blog/assets/_js/lodash.custom.js'
          'src/website/js/lib/jquery.min.js'
          'src/blog/assets/_js/jquery.autogrow.js'
          'src/blog/assets/_js/jquery.fuzzymatch.js'
          'src/blog/assets/_js/search.js'
        ]
      contact:
        dest: 'build/js/contact-8.js'
        src: [
          'src/website/js/lib/jquery.min.js'
          'src/website/js/lib/nod.min.js'
          'src/website/js/contact.js'
        ]
      newsletter:
        dest: 'build/js/newsletter-2.js'
        src: [
          'src/website/js/lib/jquery.2.0.3.min.js'
          'src/website/js/lib/bootstrap.min.js'
          'src/website/js/lib/nod.min.js'
          'src/website/js/newsletter.js'
        ]

    uglify:
      dist:
        files:
          "build/assets/js/<%= jekyllConfig.js %>.js": [
            'src/blog/assets/_js/jquery.min.js'
            'src/blog/assets/_js/jquery.unveil.min.js'
            'src/blog/assets/_js/enquire.js'
            'src/blog/assets/_js/custom.js'
          ]
          'build/assets/js/search-4.js': [
            'src/blog/assets/_js/lodash.custom.js'
            'src/website/js/lib/jquery.min.js'
            'src/blog/assets/_js/jquery.autogrow.js'
            'src/blog/assets/_js/jquery.fuzzymatch.js'
            'src/blog/assets/_js/search.js'
          ]
      contact:
        files: 'build/js/contact-8.js': [
          'src/website/js/lib/jquery.min.js'
          'src/website/js/lib/nod.min.js'
          'src/website/js/contact.js'
        ]
      newsletter:
        files: 'build/js/newsletter-2.js': [
          'src/website/js/lib/jquery.2.0.3.min.js'
          'src/website/js/lib/bootstrap.min.js'
          'src/website/js/lib/nod.min.js'
          'src/website/js/newsletter.js'
        ]

    htmlmin:
      blog:
        options:
          removeComments: on
          collapseWhitespace: off
        files: [
          { expand: on, cwd: 'build/blog/', src: ['**/*.html'], dest: 'build/blog'}
        ]

    less:
      build:
        options:
          yuicompress: on
          optimization: 1
        files: [
          'build/css/index-5.css': 'src/website/less/index.less'
          'build/css/convert-7.css': 'src/website/less/convert.less'
          'build/css/newsletter-1.css':
            'src/website/less/newsletter/index.less'
        ]

    jade:
      build:
        files: [
          'build/index.html': 'src/website/jade/index.jade'
          'build/legal/index.html': 'src/website/jade/legal/index.jade'
          {expand: on, cwd: 'src/website/jade', src: '**/*.jade', dest: 'build/', ext: '.html'}
        ]

    compress:
      dist:
        options: mode: 'gzip'
        files: [
          expand: on
          cwd: 'build/'
          src: ['**/*.html','**/*.xml','**/*.json', '**/*.txt']
          dest: 'excellenteasy.com'
        ]
      s3:
        options: mode: 'gzip'
        files: [
          expand: on
          cwd: 'build/'
          src: ['**/*.css']
          dest: 's3/css/website'
        ,
          expand: on
          cwd: 'build/'
          src: ['**/*.js']
          dest: 's3/js/website'
        ]

    shell:
      jekyll:
        command: 'jekyll build -s src/blog -d tmp'
        stdout: on
        stderr: on
        failOnError: on
      s3:
        command: './s3.sh'
        stdout: on
        stderr: on
        failOnError: on
      images:
        command: './images.sh'
        stdout: on
        stderr: on
        failOnError: on
      scp:
        command: 'scp -i ec2.pem -r excellenteasy.com ubuntu@54.221.237.104:/var/www/'
        stdout: on
        stderr: on
        failOnError: on

    watch:
      all:
        files: ['src/**/*']
        tasks: ['build']

  grunt.registerTask 'removegz', ->
    grunt.file.recurse 's3', (abspath, rootdir, subdir, filename) ->
      grunt.file.copy abspath, abspath.replace '.gz', ''
      grunt.file.delete abspath if abspath.match /\.gz$/

  grunt.registerTask '_build', [
    'copy:build'
    'less:build'
    'jade:build'
    'concat:contact'
    'concat:newsletter'
    'shell:jekyll'
    'copy:jekyll'
    'cssmin:blog'
    'htmlmin:blog'
  ]

  grunt.registerTask 'build', [
    '_build'
    'concat:build'
    'concat:search'
  ]

  grunt.registerTask 'images', [
    'imagemin:src'
    'image_resize'
    'imagemin:dist'
    'shell:images'
    'copy:images'
    'clean:images'
  ]

  grunt.registerTask 'dist', [
    'clean:build'
    '_build'
    'uglify:contact'
    'uglify:newsletter'
    'uglify:dist'
    'compress:dist'
    'compress:s3'
    'removegz'
    'copy:dist'
    'images'
    'shell:scp'
    'shell:s3'
  ]

  grunt.registerTask 'serve', [
    'build'
    'connect'
    'watch'
  ]

  grunt.registerTask 'default', ['serve']
