
class API 

    def call_api(username, password)
        response = RestClient.post('https://weblium.co/api/auth/login', { username: username, password: password }, { 'Content-Type': 'application/json' })
        return response.code, JSON.parse(response.body)
    end

end