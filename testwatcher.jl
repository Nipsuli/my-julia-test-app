using Revise
using FileWatching

# collect all file paths under ./scr
# TODO: generate these
# Revise.track("./src/MyTestApp.jl")
Revise.includet("./src/MyTestApp.jl")
Revise.includet("./src/functions.jl")
# this will run tests
Revise.includet("./test/runtests.jl")


ch = Channel(32)

function watch_and_write_to_channel(folder_name::String, ch::Channel)
    a = FileWatching.watch_folder(folder_name)
    put!(ch, a)
end


function test_watch()
    println("Watching...")

    @async watch_and_write_to_channel("./src", ch)
    @async watch_and_write_to_channel("./test", ch)
    take!(ch)

    println("Running tests")
    try
        include("./test/runtests.jl")
    catch
    end
    test_watch()
end

test_watch()
nothing
