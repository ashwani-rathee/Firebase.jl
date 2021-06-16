module Firebase

# Includes
include("firestore.jl")
include("firestore-token.jl")
include("firebaseauth.jl")
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
export init
export projectid
export get_token
export auth_header
export firestore_batchget
export firestore_batchwrite
export firestore_beginTransaction
export firestore_createdoc
export firestore_commit
export firestore_deletedoc
export firestore_getcollectionids
export firestore_getdoclist
export firestore_partitionquery
export firestore_patch
export firestore_rollback
export firestore_runquery
# Realtime database related
export realdb_init
export realdb_get
export realdb_post
export realdb_delete
export realdb_put
export realdb_patch


end # module
