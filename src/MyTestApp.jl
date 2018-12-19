module MyTestApp
include(joinpath(@__DIR__, "functions.jl"))
# include("src/functions.jl")

# second try with bare HTTP
using Sockets
using HTTP
using JSON2
using .Functions

const MY_TEST_ROUTER = HTTP.Router()

root(req::HTTP.Request) = HTTP.Response(200, "I am Groot!")
show_req(req::HTTP.Request) = HTTP.Response(200, repr(req))

# in master
# HTTP.@register(MY_TEST_ROUTER, "GET", "/", root)
# HTTP.serve(MY_TEST_ROUTER, Sockets.localhost, 8000)

# in 0.7.1
HTTP.Handlers.register!(MY_TEST_ROUTER, "GET", "/", root)
HTTP.Handlers.register!(MY_TEST_ROUTER, "GET", "/show_req", show_req)
HTTP.Handlers.register!(MY_TEST_ROUTER, "GET", "/show_req/*", show_req)
HTTP.Handlers.register!(MY_TEST_ROUTER, "GET", "/pi", req -> HTTP.Response(200, JSON2.write(Dict("pi" => Float64(f())))))

server = HTTP.Servers.Server(MY_TEST_ROUTER)
# HTTP.serve(server, Sockets.localhost, 8000)

# @async HTTP.serve(server, Sockets.localhost, 8000)
# this should kill the server, but it doesn't :/
# put!(server.in, HTTP.Servers.KILL)


end  # module MyTestApp
