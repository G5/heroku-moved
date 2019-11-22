## What?

It's just a simple sinatra app that will run without any intervention on Heroku that will tell a visitor that an app has moved. Set the `MOVED_TO` environment variable on the app to the new domain (no protocol, just `whatever.yourdomain.com`). That's it.

**Update**: Guess what? That's not all. In some cases, I do need to do a real redirect. It's not the default, but you can optionally specify `REAL_REDIRECT=true`. This will redirect all visitors to the `MOVED_TO` domain, respecting deep links (e.g. `old.com/bar/baz` will go to `new.com/bar/baz`). If you set `REAL_REDIRECT=shallow` it will do a full redirect, but discarding the original URI.

## Docker/Kubernetes

This is available as a Docker Hub image at `g5search/heroku-moved` in the Docker Hub Registry, and `deployment.yaml` in this repository shows an example Kubernetes Deployment YAML. You **should modify it** before use, as the proper environment variable values depend on your situation.
