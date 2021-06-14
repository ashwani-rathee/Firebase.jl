
using HTTP
function get(url)
    try
        response = HTTP.get(url)
        return String(response.body)
    catch e
        return "Error occurred : $e"
    end
end

function post(url)
    try
        response = HTTP.post(url)
        return String(response.body)
    catch e
        return "Error occurred : $e"
    end
end

function delete(url)
    try
        response = HTTP.delete(url)
        return String(response.body)
    catch e
        return "Error occurred : $e"
    end
end

function push(path...; content ={"apple":1})

end

function set(path...; content ={"apple":1})

end

response = get("https://firestore.googleapis.com/v1/projects/julian-875a2/databases/(default)/documents/Julian/Layer2/fields/Label1")
println(response)

