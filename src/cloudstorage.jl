STORE_URL = nothing

"""
cloudstore_init(url)

Set cloud storage url initialize

# Example

```julia
cloudstore_init("https://firebasestorage.googleapis.com/v0/b/[PROJECT_ID].appspot.com/o")
```
"""
function cloudstore_init(url)
    global STORE_URL = url
    println("Cloud Storage set:", STORE_URL)
end

"""
cloudstore_sendfile(file2download = "")

Send a file to cloud storage to store

# Example

```julia
init("[PROJECT_SDK].json")
cloudstore_init("https://firebasestorage.googleapis.com/v0/b/[PROJECT_ID].appspot.com/o")
cloudstore_sendfile("/audio/data.mp3")
```
"""
function cloudstore_sendfile(file2upload="/test/onedance.mp3")
    # println(STORE_URL)
    string  = readchomp(`file --mime-type -b $(file2upload[2:end])`)
    file_binary = open(file2upload[2:end], "r")
    s = read(file_binary, String)
    header = Dict("Content-Type" => "$string", auth_header())
    project_id = projectid()
    spliturl= split(file2upload[2:end],"/")
    file2upload = join(spliturl, "%2F")
    final_url = "$STORE_URL$file2upload"
    body = s
    println("FINAL_URL:", final_url)
    http_response = HTTP.post(
        final_url,
        header,
        body
    )
    response_string = String(http_response.body)
    JSON.parse(response_string)

end

# STORE_URL = "https://firebasestorage.googleapis.com/v0/b/fir-jl-457eb.appspot.com/o/"

"""
cloudstore_get(file2download = "")

Get a file cloud storage

# Example
```julia
init("[PROJECT_SDK].json")
cloudstore_init("https://firebasestorage.googleapis.com/v0/b/[PROJECT_ID].appspot.com/o")
cloudstore_get("/audio/data.mp3")
cloudstore_get("/data.mp3")
```
"""
function cloudstore_get(file2download="242160__xserra__cello-phrase.wav")
    temp = file2download
    spliturl= split(file2download[2:end],"/")
    file2download = join(spliturl, "%2F")
    final_url = "$STORE_URL$file2download?alt=media&token=878c7715-61cf-46b5-a9c0-a790300d8c43"
    println("Final URL:",final_url)
    res = HTTP.get(final_url)
    dir = "$(temp[2:end])"
    dirtocreate=join(spliturl[1:end-1],"/")
    mkpath(dirtocreate)
    # mkpath(dir)
    out =open("$dir","w")
    write(out,res.body)
    close(out)
end