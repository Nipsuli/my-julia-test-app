# my-julia-test-app

Just testing how to build Julia app. And other Julia related testing.

Things to test:

- [ ] test watcher
  - [x] get it working
  - [x] faster watcher (use `@async` and separate watchers for /src and /test)
  - [ ] autoload and watch files

- [ ] creating rest api
  - [ ] simple version
  - [ ] auth tokens stuff
  - [ ] hot reloading, hrmph not seem to work as nicely as expected

- [ ] compiling to single binary

## Set up

1. install Julia: `brew cask install julia`
2. install packages: `julia --project -e 'using Pkg; Pkg.instantiate()'`

## Tests
To run test watcher:
```
julia --project --color=yes testwatcher.jl
```

To run tests once:
```
julia --project --color=yes test/runtests.jl
```

## Managing packages
Activate `Pkg` and the project env
```
shell> julia --project
julia> ]
(my-julia-test-app) pkg> *run management commands here*
```

## Tips and stuff

Try catch and colored output
```Julia
try
    stuff
catch e
    printstyled("Stuff failing on $e\n", color=:red)
end
```

Env variables are naturally in global `ENV`-Dict
