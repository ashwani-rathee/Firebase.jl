using Firestore

Firestore.init("julian-875a2-firebase-adminsdk-ukwxc-f020b19fbb.json")

# Firestore.get(collection_id,doc_id) # get single doc
# Firestore.get(collection_id) # get all docs in collection w/o sub_collections)
# Firestore.get(collection_id,doc_id,sub_collection_id_1,doc_id_2) # get doc in sub collection
# Firestore.get(collection_id,doc_id,sub_collection_id_1,doc_id_2,sub_collection_id_2) # get all docs in sub collection