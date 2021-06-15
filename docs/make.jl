push!(LOAD_PATH,"../src/")
using Documenter
# Inside make.jl

makedocs(sitename="Documentation",
        pages=[
            "Home" => "index.md"],
            format = Documenter.HTML(
                prettyurls = get(ENV, "CI", nothing) == "true"
            ))
deploydocs(repo = "github.com/ashwani-rathee/Firebase.jl")