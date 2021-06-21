using GoogleCloud
STORE_URL = nothing

function cloudstore_init(url = "https://firebasestorage.googleapis.com/v0/b/fir-jl-457eb.appspot.com/o")
    global STORE_URL = url
    println("Cloud Storage set:", STORE_URL)
end

"""
cloudstore_sendfile(file2upload="test/onedance.mp3")

Upload file to cloud Storage

# Example

```julia
cloudstore_init("[STORE_URL]")
cloudstore_sendfile("[FILE_LOCATION", "[CONTENT_TYPE", "[STORAGE_LOCATION]")

#=
Dict{String, Any} with 15 entries:
  "md5Hash"            => "OSGtKjo4CNeMz49k+71MaA=="
  "name"               => "audio/data.mp3"
  "downloadTokens"     => "4f9be41c-bd5c-412a-a40d-1a5898812c52"
  "metageneration"     => "1"
  "bucket"             => "fir-jl-457eb.appspot.com"
  "timeCreated"        => "2021-06-21T16:59:25.222Z"
  "contentType"        => "audio/mp3"
  "updated"            => "2021-06-21T16:59:25.222Z"
  "etag"               => "CJyF98OZqfECEAE="
  "size"               => "3556629"
  "generation"         => "1624294765216412"
  "storageClass"       => "STANDARD"
  "crc32c"             => "Qu2WQw=="
  "contentDisposition" => "inline; filename*=utf-8''data.mp3"
  "contentEncoding"    => "identity"
=#
```

"""
function cloudstore_sendfile(file2upload="test/onedance.mp3", content_type="audio/mp3", storage_location ="audio%2Fdata.mp3")
    file_binary = open(file2upload, "r")
    s = read(file_binary, String)
    header = Dict("Content-Type" => "$content_type", auth_header())
    project_id = projectid()
    final_url = "$(STORE_URL)/$storage_location"
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

"""
cloudstorage_get()

"""
function cloudstorage_get()
    res = HTTP.get("https://firebasestorage.googleapis.com/v0/b/fir-jl-457eb.appspot.com/o/242160__xserra__cello-phrase.wav?alt=media&token=878c7715-61cf-46b5-a9c0-a790300d8c43")

    # julia> out =open("data.mp3","w")
    # IOStream(<file data.mp3>)
    
    # julia> write(out,res.body)
    # 748202
    
    # julia> close(abc)
    # ERROR: UndefVarError: abc not defined
    # Stacktrace:
    #  [1] top-level scope
    #    @ REPL[18]:1
    
    # julia> close(out)
end