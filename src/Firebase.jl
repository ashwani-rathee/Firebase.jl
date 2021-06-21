module Firebase

# Includes
include("firestore.jl")
include("firestore-token.jl")
include("firebaseauth.jl")
include("convert.jl")
include("cloudstorage.jl")
include("realtime.jl")
# include("auth.jl")

# Imported packages
using HTTP, GoogleCloud, JSON

# Exported Functions
export get
export get_collection, get_singlepage,get_document, get_request
export convert_to_dict
export convert_field
export convert_timestamp
export convert_map
export convert_array

# Firebase authentication related
export set_webapikey
export firebase_signup
export firebase_signin
export firebase_signinanon
export firebase_signinoauth
export firebase_fetchproviders
export firebase_passwordreset
export verify_passwordresetcode
export confirm_passwordreset
export firebase_changeemail
export firebase_changepassword
export firebase_updateprofile
export firebase_getuserinfo
export firebase_linkuserinfo
export firebase_unlinkprovide
export firebase_verifyemail
export firebase_confirmemailverify
export firebase_deleteuser

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

# cloud Storage Functions
export cloudstore_init
export cloudstore_sendfile
end # module
