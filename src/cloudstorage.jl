STORE_URL = nothing
function cloudstore_init()
    global STORE_URL = url
    println("Cloud Storage set:", STORE_URL)
end

"""


"""
function cloudstore_sendfile(file2upload="test/onedance.mp3")
    file_binary = open(file2upload, "r")
    s = read(file_binary, String)      
    header = Dict("Content-Type" => "audio/mp3", auth_header())
    project_id = projectid()
    final_url = "https://firebasestorage.googleapis.com/v0/b/fir-jl-457eb.appspot.com/o/audio%2Fdata.mp3"
    final_url = "https://firebasestorage.googleapis.com/v0/b/fir-jl-457eb.appspot.com/o/data.mp3"
    # body = JSON.json(s)
    # println("Body:", body)
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


function cloudstorage_get()
    # res = HTTP.get("https://firebasestorage.googleapis.com/v0/b/fir-jl-457eb.appspot.com/o/242160__xserra__cello-phrase.wav?alt=media&token=878c7715-61cf-46b5-a9c0-a790300d8c43")

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