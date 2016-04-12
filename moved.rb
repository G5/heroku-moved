require 'sinatra'

get "/*" do
  to = ENV["MOVED_TO"]
  <<-EOS
<html>
  <body>
    <h2>This site has moved!</h2>
    <p>
      It is now available at <a href="///#{to}">#{to}</a>. Please update your bookmarks.
    </p>
  </body>
</html>
  EOS
end
