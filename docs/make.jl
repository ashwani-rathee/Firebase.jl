push!(LOAD_PATH,"../src/")
using Firebase
using Documenter

DocMeta.setdocmeta!(Firebase, :DocTestSetup, :(using Firebase); recursive=true)

makedocs(;
    modules=[Firebase],
    authors="Panquesito7",
    repo="github.com/ashwani-rathee/Firebase.jl/blob/{commit}{path}#{line}",
    sitename="Firebase.jl",
    format=Documenter.HTML(;
        prettyurls=Main.get(ENV, "CI", "false") == "true",
        canonical="https://ashwani-rathee.github.io/Firebase.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/ashwani-rathee/Firebase.jl",
    devbranch="main",
)