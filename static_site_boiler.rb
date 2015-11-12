
require 'fileutils'

account = "Zach"   # => Change this to your Username.
version = "2.2.3"   # => Ruby Version
puts "What would you like to name the Static Site?"
site = gets.chomp.downcase
dir = "/Users/#{account}"
directory = "#{dir}/Documents/Projects/Static/#{site}" # => Enter your Directory with the VARIABLES!


def open(item)
  case item
  when "a"
    puts "Font Awesome Added"
    gemfile = File.open("Gemfile", "a+"){|f| f << "\ngem 'font-awesome-rails'"}
  when "b"
    puts "Burbon Added"
    gemfile = File.open("Gemfile", "a+"){|f| f << "\ngem 'bourbon'"}
  when "c"
    puts "TwitterBootstrap Added"
    html = File.open("index.html", "a+"){|f| f << "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css\">"}
  when "d"
    puts "Materialize Added"
    html = File.open("index.html", "a+"){|f|
      f << "
      <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/css/materialize.min.css\">
      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/js/materialize.min.js\"></script>
      "}
  when "e"
    puts "Google's Material Design Added"
    html = File.open("index.html", "a+"){|f|
      f << "
      <link rel=\"stylesheet\" href=\"https://storage.googleapis.com/code.getmdl.io/1.0.4/material.indigo-pink.min.css\">
      <script src=\"https://storage.googleapis.com/code.getmdl.io/1.0.4/material.min.js\"></script>
      <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/icon?family=Material+Icons\">
      "}
  when "f"
    puts "jQuery Added"
    html = File.open("index.html", "a+"){|f|
      f <<
      "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></script>"}
  when "g"
    puts "jQuery Mobile Added"
    html = File.open("index.html", "a+"){|f|
      f <<"
      <link rel=\"stylesheet\" href=\"https://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.css\">
      <script src=\"https://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.js\"></script>"}
  when "h"
    puts "Grid System Added"
    html = File.open("../index.html", "a+"){|f|
      f <<"
        <!-- EXAMPLE OF GRID -->
        <div class=\"section group\">
          <div class=\"col col1 txtCent\">
          1 of 12
          </div>
          <div class=\"col col2 txtCent\">
          2 of 12
          </div>
          <div class=\"col col3 txtCent\">
          3 of 12
          </div>
          <div class=\"col col6 txtCent\">
          6 of 12
          </div>
        </div>
      "}
    gridFile = File.open("grid.css", "w") { |file| file.write("
        /*  SECTIONS  */
        .section {
        	clear: both;
        	padding: 0px;
        	margin: 0px;
        }

        /*  COLUMN SETUP  */
        .col {
        	display: block;
        	float:left;
        	margin: 1% 0 1% 1.6%;
        }
        .col:first-child { margin-left: 0; }

        /*  GROUPING  */
        .group:before,
        .group:after { content:""; display:table; }
        .group:after { clear:both;}
        .group { zoom:1; /* For IE 6/7 */ }
        /*  GRID OF TWELVE  */
        .col12 {
        	width: 100%;
        }

        .col11 {
          	width: 91.53%;
        }
        .col10 {
          	width: 83.06%;
        }

        .col9 {
          	width: 74.6%;
        }

        .col8 {
          	width: 66.13%;
        }

        .col7 {
          	width: 57.66%;
        }

        .col6 {
          	width: 49.2%;
        }

        .col5 {
          	width: 40.73%;
        }

        .col4 {
          	width: 32.26%;
        }

        .col3 {
          	width: 23.8%;
        }

        .col2 {
          	width: 15.33%;
        }

        .col1 {
          	width: 6.866%;
        }

        /*  GO FULL WIDTH BELOW 480 PIXELS */
        @media only screen and (max-width: 480px) {
        	.col {  margin: 1% 0 1% 0%; }

            .col1, .col2, .col3, .col4, .col5, .col6, .col7, .col8, .col9, .col10, .col11, .col12 {
        	width: 100%;
        	}
        }
        /* CENTER TEXT */
        .txtCent{
        text-align: center;
        }
      ") }


  when "z"
      %x(ruby server.rb)
  end
end

Dir.mkdir(directory)
Dir.chdir(directory)
puts Dir.pwd

server = File.open("server.rb", "w") { |file| file.write("require 'sinatra'\n\nget '/' do\n\tFile.read(File.join('public/', 'index.html'))\nend") }
procfile = File.open("Procfile", "w") { |file| file.write("web: ruby server.rb -p $PORT") }
gemfile = File.open("Gemfile", "w") { |file| file.write("source 'https://rubygems.org'\n\nruby '#{version}'\n\ngem 'sinatra'") }

items = ["a","b","c"]
puts "Choose the items you want to add to your HTML site:\n
ie: \"adf\" will give add Font Awesome, Materialize, and Material Design\n
***BE CAREFUL WHEN USING MORE THAN ONE***\n
a. Font Awesome\n
b. Burbon\n
c. TwitterBootstrap\n
d. Materialize\n
e. Google's Material Design\n
f. jQuery\n
g. jQuery Mobile\n
h. CSS Mobile Responsive Grid\n
z. Start the Sever Imediately
"
choice = gets.chomp.downcase

open("a") if choice.include?('a')
open("b") if choice.include?('b')

pub = "#{directory}/public"
Dir.mkdir(pub)
Dir.chdir(pub)

html = File.open("index.html", "w") { |file| file.write("
  <link rel=\"stylesheet\" type=\"text/css\" href=\"css/reset.css\">
  <link rel=\"stylesheet\" type=\"text/css\" href=\"css/stylesheet.css\">
  <!-- if you do not want to use Grid System, delete the line below -->
  <link rel=\"stylesheet\" type=\"text/css\" href=\"css/grid.css\">
  <!DOCTYPE html>
<html>
  <head>
    <meta charset=\"utf-8\">
     <title></title>")}

open("c") if choice.include?('c')
open("d") if choice.include?('d')
open("e") if choice.include?('e')
open("f") if choice.include?('f')
open("g") if choice.include?('g')


html = File.open("index.html", "a+"){|f| f << "
  </head>
  <body>
  <h2>#{site.capitalize}</h2>"}

Dir.mkdir("#{pub}/css")
Dir.chdir("#{pub}/css")


open("h") if choice.include?('h')

html = File.open("../index.html", "a+"){|f| f << "
  </body>
</html>
"}

css = File.open("stylesheet.css", "w") { }

reset = File.open("reset.css", "w") { |file| file.write("
  /* http://meyerweb.com/eric/tools/css/reset/
   v2.0 | 20110126
   License: none (public domain)
*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}
  ")}

  Dir.chdir(directory)

  puts "Bundling"
  %x(bundle install)
  puts "Bundle Complete!"

  open("z") if choice.include?('z')
