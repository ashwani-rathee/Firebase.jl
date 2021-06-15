using JSON, HTTP

const FIRESTORE_URL = "https://firestore.googleapis.com/v1"

function get_singlepage(documentpath; pagesize = 300, pagetoken::String = "")
    @show "Firestore.get_singlepage", documentpath, pagesize, pagetoken
    base_url = FIRESTORE_URL
    headers = Dict(auth_header())
    project_id = projectid()
    firestore_path = "/projects/$project_id/databases/(default)/documents"
    url = "$base_url$firestore_path/$documentpath"
    query = Dict{String,Any}("pageSize" => pagesize)
    if !isempty(pagetoken)
        query["pageToken"] = pagetoken
    end
    http_response = HTTP.get(url, headers; query = query)
    response_string = String(http_response.body)
    JSON.parse(response_string)
end

function get_collection(documentpath; pagesize = 300)
    @show "Firestore.get_collection", documentpath, pagesize
    docs = []
    pagetoken = ""
    while true
        response = get_singlepage(
            documentpath,
            pagesize = pagesize,
            pagetoken = pagetoken,
        )
        isempty(response) && return docs
        push!(docs, response["documents"]...)
        !haskey(response, "nextPageToken") && break
        pagetoken = response["nextPageToken"]
    end
    docs
end

get_document(documentpath) = get_singlepage(documentpath)


const FIRESTORE_URL = "https://firestore.googleapis.com/v1" 

function get(path...)
    @show "Firestore.get", path
    full_path = join(path,'/')
    length(path) % 2 == 0 && return convert_map(get_document(full_path))
    map(convert_map,get_collection(full_path))
end

function get_request(path::String)
    header = Dict(auth_header())
    project_id = projectid()

    url = "$(FIRESTORE_URL)/projects/$project_id/databases/(default)/documents$path"
    println(url)
    http_response = HTTP.get(url,header)
    response_string = String(http_response.body)
    JSON.parse(response_string)
end
