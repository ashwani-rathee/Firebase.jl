module Firebase

# Includes
include("token.jl")
include("get.jl")
include("convert.jl")
# include("auth.jl")

# Imported packages
import HTTP, GoogleCloud, JSON

# Exported Functions
export greet, get
export get_collection, get_singlepage,get_document, get_request
export convert_to_dict
export convert_field
export convert_timestamp
export convert_map
export convert_array

end # module
