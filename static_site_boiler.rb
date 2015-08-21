
require 'fileutils'

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
  when "d"
    puts "Something Added"
  when "e"
    puts "Google's Material Design Added"
    html = File.open("index.html", "a+"){|f|
      f << "
      <link rel=\"stylesheet\" href=\"https://storage.googleapis.com/code.getmdl.io/1.0.4/material.indigo-pink.min.css\">
      <script src=\"https://storage.googleapis.com/code.getmdl.io/1.0.4/material.min.js\"></script>
      <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/icon?family=Material+Icons\">
      "}
  end
end


puts "What would you like to name the Static Site?"

site = gets.chomp.downcase
account = "ZachP"
dir = "/Users/#{account}"   # => Change this to your Username.
version = "2.2.2"   # => Ruby Version

directory = "#{dir}/Documents/Projects/Static/#{site}" # => Enter your Directory with the VARIABLES!

Dir.mkdir(directory)
Dir.chdir(directory)
puts Dir.pwd


server = File.open("server.rb", "w") { |file| file.write("require 'sinatra'\n\nget '/' do\n\tFile.read(File.join('public/', 'index.html'))\nend") }
procfile = File.open("Procfile", "w") { |file| file.write("web: ruby server.rb -p $PORT") }
gemfile = File.open("Gemfile", "w") { |file| file.write("source 'https://rubygems.org'\n\nruby '#{version}'\n\ngem 'sinatra'") }

items = ["a","b","c"]
puts "Choose the items you want to add to your HTML site:\n
ie: \"adf\" will give add Font Awesome, Materialize, and Material Design\n
a. Font Awesome\n
b. Burbon\n
c. TwitterBootstrap\n
d. Materialize\n
e. Something\n
f. Google's Material Design\n
"
choice = gets.chomp.downcase



open("a") if choice.include?('a')
open("b") if choice.include?('b')




puts 'test'




pub = "#{directory}/public"
Dir.mkdir(pub)
Dir.chdir(pub)


html = File.open("index.html", "w") { |file| file.write("
  <link rel=\"stylesheet\" type=\"text/css\" href=\"css/reset.css\">
  <link rel=\"stylesheet\" type=\"text/css\" href=\"css/stylesheet.css\">
  <!DOCTYPE html>
<html>
  <head>
    <meta charset=\"utf-8\">
     <title></title>
    ")}

open("c") if choice.include?('c')
open("d") if choice.include?('d')
open("e") if choice.include?('e')
open("f") if choice.include?('f')


html = File.open("index.html", "a+"){|f| f << "
  </head>
  <body>
  <h2>#{site.capitalize}</h2>
  </body>
</html>
"}

Dir.mkdir("#{pub}/css")
Dir.chdir("#{pub}/css")

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

  %x(ruby server.rb)
