module Firebase

# Includes
include("token.jl")
include("get.jl")
include("convert.jl")
include("realtime.jl")
# include("auth.jl")

# Imported packages
using HTTP, GoogleCloud, JSON

# Exported Functions
export greet, get
export get_collection, get_singlepage,get_document, get_request
export convert_to_dict
export convert_field
export convert_timestamp
export convert_map
export convert_array

# Firebase database related
export firestore_batchget
export firestore_createdoc
export firestore_deletedoc
export firestore_getcollectionids
export firestore_getdoclist

# Realtime database related
export readdbinit
export readldb_get
export realdb_post
export realdb_delete
export realdb_put


end # module
