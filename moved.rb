require 'sinatra'

get "/*" do
  if request.fullpath == "/healthz"
    return "OK"
  end

  to = ENV["MOVED_TO"]

  case ENV["REAL_REDIRECT"]
  when "true"
    redirect to(request.scheme + "://" + to + request.fullpath)
    return
  when "shallow"
    redirect to(request.scheme + "://" + to )
    return
  else
    raise "unknown REAL_REDIRECT configuration"
  end

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
