using GoogleCloud
using Glob
using REPL
using REPL.TerminalMenus

const FIRESTORE_URL = "https://firestore.googleapis.com/v1"

function init(filepath)
    global CREDENTIALS
    CREDENTIALS = JSONCredentials(filepath)
    println("Project Admin SDK key is ", filepath, " now!!")
    println(CREDENTIALS)
end

function init()
    global CREDENTIALS
    try
        filenames = glob("*.json", "firebase")
        menu = RadioMenu(filenames, pagesize=4)
        file = request("Choose your admin sdk key for use:", menu)
        
        if file != -1
            println("Project Admin SDK key is ", filenames[file], " now!!")
            CREDENTIALS = JSONCredentials(filenames[file])
        else
            println("Menu canceled.")
        end
    catch e
        println("Either the folder firebase doesn't exist or it's empty")
    end
end

function projectid()
    global CREDENTIALS
    isnothing(CREDENTIALS) && throw("Run Firebase.init() to load credentials first")
    CREDENTIALS.project_id
end

function get_token()
    global CREDENTIALS
    isnothing(CREDENTIALS) && throw("Run Firebase.init() to load credentials first")
    session = GoogleSession(CREDENTIALS, ["datastore"])
    GoogleCloud.authorize(session)
end

function auth_header()
    println(CREDENTIALS)
    token = get_token()
    "Authorization" => "$(token[:token_type]) $(token[:access_token])"
end
