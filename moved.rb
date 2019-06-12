require 'sinatra'

get "/*" do
  # Redirect to websites overview for the relevant client
  client_uid = ENV["G5_CLIENT_UID"].split('/').last
  redirect to("#{ENV["MOVED_TO"]}/clients/#{client_uid}/websites")
  return

  to = ENV["MOVED_TO"]

  if ENV["REAL_REDIRECT"] == "true"
    redirect to(request.scheme + "://" + to + request.fullpath)
    return
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
