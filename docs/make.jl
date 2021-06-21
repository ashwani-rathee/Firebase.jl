
push!(LOAD_PATH,"../src/")
using Firebase
using Documenter

DocMeta.setdocmeta!(Firebase, :DocTestSetup, :(using Firebase); recursive=true)

makedocs(;
    modules=[Firebase],
    authors="Ashwani Rathee",
    repo="github.com/ashwani-rathee/Firebase.jl/blob/{commit}{path}#{line}",
    sitename="Firebase.jl",
    format=Documenter.HTML(;
        prettyurls=Base.get(ENV, "CI", "false") == "true",
        canonical="https://ashwani-rathee.github.io/Firebase.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Cloud Firestore" => "firestore.md",
        "Cloud Authentication" => "authentication.md",
        "Realtime Database" => "realtime.md",
        "Cloud Storage" => "storage.md",
        "Utility Functions" => "utility.md",
    ],
)

deploydocs(;
    repo="github.com/ashwani-rathee/Firebase.jl",
    devbranch="main",
    push_preview = true
) 