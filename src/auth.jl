using HTTP,JSON,Firebase
# Firebase Auth  backend a REST API

Firebase.init("test/fir-jl-457eb-firebase-adminsdk-40928-0efd6a89e7.json");
header = Dict(
    "Authorization" =>
        "Bearer ya29.c.Kp8BAwh19dsnHN7yPkhlb3toQleIQuAQ94YlV-aXs6ijDEvEKtvKmoNiXw9Fg7u-EjpHjusuu_k9nIaW7tFohhW97fPTx7G0KowT-R0nwI52XdvHrG-TrRAZOjC38eiu_eaPgXTh2wxHUDH-sVPpvA5Yzv8DgCoCRTUboxa3ajDVhRiyvM7uOiFcR27k6eoMrOmk_EBTabpODRLhtIeKG10O",
);
body = """
{
    email: "ab669522@gmail.com",
    password: "helloworld!!",
    returnSecureToken: true
}
"""
HTTP.post("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAEeSloxz3EtXTm73EdSIWY_WRVPF51hhI",header,body)