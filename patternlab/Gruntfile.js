var pkgjson = require('./package.json');

var config = {
  pkg: pkgjson,
  app: 'src',
  dist: 'dist'
};

module.exports = function(grunt) {

  // Configuration
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    config: config,
    bower: grunt.file.readJSON('./.bowerrc'),
    shell: {
      patternlab: {
        command: "php core/builder.php -gp"
      },
      patterngenerate: {
        command: "php core/builder.php -g"
      }
    },
    sass: {
      options: {
        sourceMap: true,
        outputStyle: 'compressed'
      },
      dist: {
        options: {
            style: 'compressed'
        },
        files: {
            'public/css/style.css': 'source/css/style.scss',
            'public/styleguide/css/styleguide.css': 'public/styleguide/css/styleguide.scss',
            'public/styleguide/css/styleguide-specific.css': 'public/styleguide/css/styleguide-specific.scss'
        }
      }
    },
    uglify: {
      options: {
        banner: '/*! <%= grunt.template.today("yyyy-mm-dd") %> */'
      },
      dist: {
        files: {
          'source/js/main.min.js': [
            '<%= bower.directory %>/jquery/dist/jquery.js',
            'source/js/plugins/*.js',
            'source/js/src/*.js'
          ]
        }
      }
    },
    connect: {
      server: {
        options: {
          port: 8080,
          hostname: 'localhost',
          base: 'public/'
        }
      }
    },
    watch: {
      html: {
          files: [
            'source/_patterns/**/*.mustache',
            'source/_patterns/**/*.json',
            'source/_data/*.json',
          ],
          tasks: [ 'shell:patternlab' ]
      },
      js: {
          files: [
            'source/js/plugins/*.js',
            'source/js/src/*.js',
          ],
          tasks: [ 'uglify', 'shell:patterngenerate', 'sass' ],
      },
      css: {
          files: [
            'source/css/*.scss',
            'source/css/**/*.scss',
            'public/styleguide/css/**/*.scss'
          ],
          tasks: [ 'sass' ]
      },
      options: {
          spawn: false,
          livereload: true
      }
    }
  });

  // Plugins
  grunt.loadNpmTasks('grunt-shell');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-sass');
  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-notify');

  // Tasks
  grunt.registerTask('default', [ 'connect', 'uglify', 'sass', 'shell:patternlab', 'watch' ]);
  grunt.registerTask('no-server', [ 'uglify', 'sass', 'shell:patternlab', 'watch' ]);
};