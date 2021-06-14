# Firebase.jl

Google Firestore -> julia

https://firebase.google.com/docs/firestore/use-rest-api

Can currently only read from firestore, using the REST API

PR's welcome

Example:

```
import Firestore

Firestore.init(path_to_firestore_service_account_key_json)

Firestore.get(collection_id,doc_id) # get single doc
Firestore.get(collection_id) # get all docs in collection w/o sub_collections)
Firestore.get(collection_id,doc_id,sub_collection_id_1,doc_id_2) # get doc in sub collection
Firestore.get(collection_id,doc_id,sub_collection_id_1,doc_id_2,sub_collection_id_2) # get all docs in sub collection
```
