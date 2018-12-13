# my-julia-test-app

Just testing how to build Julia app. And other Julia related testing.

Things to test:

- [ ] test watcher
  - [ ] get it working
  - [ ] faster watcher (use `@async` and separate watchers for /src and /test)
  - [ ] autoload and watch files

- [ ] creating rest api
  - [ ] simple version
  - [ ] auth tokens stuff

- [ ] compiling to single binary

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
shell> julia
julia> ]
(1.0) pkg> activate .
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
