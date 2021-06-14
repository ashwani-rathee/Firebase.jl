module Firebase

# Includes
include("token.jl")
include("get.jl")
include("convert.jl")

# Imported packages
import HTTP, GoogleCloud, JSON

# Exported Functions
export greet, get
export get_collection, get_singlepage,get_document
export convert_to_dict
export convert_field
export convert_timestamp
export convert_map
export convert_array

function get(path...)
    @show "Firestore.get", path
    
    full_path = join(path,'/')
    println("Full Path:", full_path)
    length(path) % 2 == 0 && return convert_map(get_document(full_path))
    map(convert_map,get_collection(full_path))
end

function post(path...)
    @show "Firestore.get", path
    
    full_path = join(path,'/')
    println("Full Path:", full_path)
    length(path) % 2 == 0 && return convert_map(get_document(full_path))
    map(convert_map,get_collection(full_path))
end

function delete(path...)
    @show "Firestore.get", path
    
    full_path = join(path,'/')
    println("Full Path:", full_path)
    length(path) % 2 == 0 && return convert_map(get_document(full_path))
    map(convert_map,get_collection(full_path))
end

function get(path...)
    @show "Firestore.get", path
    
    full_path = join(path,'/')
    println("Full Path:", full_path)
    length(path) % 2 == 0 && return convert_map(get_document(full_path))
    map(convert_map,get_collection(full_path))
end
end # module
