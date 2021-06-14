using Dates


doc_id(doc) = split(doc["name"], '/')[end]

function convert_to_dict(documents)
    y = Dict{String,Dict{String,Any}}()
    for doc in documents
        id = doc_id(doc)
        y[id] = doc["fields"]
    end
    y
end

function convert_field(x)
    y_type = collect(keys(x))[1]
    y = x[y_type]
    y_type == "nullValue" && return nothing
    y_type == "booleanValue" && return y
    y_type == "integerValue" && return parse(Int, y)
    y_type == "doubleValue" && return y
    y_type == "timestampValue" && return convert_timestamp(y)
    y_type == "stringValue" && return y
    y_type == "arrayValue" && return convert_array(y)
    y_type == "mapValue" && return convert_map(y)
end

function convert_timestamp(x)
    ix = findlast('.', x)
    isnothing(ix) && (ix = findlast('Z', x))
    y = isnothing(ix) ? x : x[1:ix-1]
    DateTime(y, dateformat"yyyy-mm-ddTHH:MM:SS")
end

function convert_array(x)
    isempty(x) && return []
    y = []
    for e in x["values"]
        push!(y, convert_field(e))
    end
    y
end

function convert_map(x)
    y = Dict{String,Any}()
    haskey(x, "name") && (y["__id__"] = doc_id(x))
    isempty(x) && return y
    for (k, v) in x["fields"]
        y[k] = convert_field(v)
    end
    y
end
