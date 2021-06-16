using GoogleCloud

const FIRESTORE_URL = "https://firestore.googleapis.com/v1"

function init(filepath)
    global CREDENTIALS
    CREDENTIALS = JSONCredentials(filepath)
    println(CREDENTIALS)
end

function projectid()
    global CREDENTIALS
    isnothing(CREDENTIALS) && throw("Run JuliaFirestore.init(filepath) to load credentials first")
    CREDENTIALS.project_id
end

function get_token()
    global CREDENTIALS
    isnothing(CREDENTIALS) && throw("Run JuliaFirestore.init(filepath) to load credentials first")
    session = GoogleSession(CREDENTIALS, ["datastore"])
    GoogleCloud.authorize(session)
end

function auth_header()
    println(CREDENTIALS)
    token = get_token()
    "Authorization" => "$(token[:token_type]) $(token[:access_token])"
end
