import Foundation

struct WeatherResults: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather: Decodable, Hashable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

class WeatherAPI: ObservableObject {
    static let shared = WeatherAPI()
    private init() {}
    @Published var posts = [Weather]()
    @Published var weatherResults: WeatherResults?
    
    // Property List 파일에 저장된 API_KEY를 읽어오기 위한 함수
    // - Property List 파일에 API_KEY가 들어있으니 .gitIgnore에 추가해줘야함
    private var apiKey: String? {
        get {
            let keyFileName = "ApiKeys"
            let api_key = "API_KEY"
            
            // 생성한 .plist 파일 경로 불러오기
            guard let filePath = Bundle.main.path(forResource: keyFileName, ofType: "plist") else { fatalError("Couldn't find file '\(keyFileName).plist'") }
            
            // .plist 파일 내용을 딕셔너리로 받아오기
            let plist = NSDictionary(contentsOfFile: filePath)
            
            // 딕셔너리에서 키 찾기
            guard let value = plist?.object(forKey: api_key) as? String else { fatalError("Couldn't find key '\(api_key)'") }
            
            return value
        }
    }
    
    func fetchData() {
        guard let apiKey = apiKey else { return }

        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=gwangju&appid=\(apiKey)"

        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // 정상적으로 값이 오지 않았을 때 처리
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }
       
            do {
                let json = try JSONDecoder().decode(WeatherResults.self, from: data)
                DispatchQueue.main.async{
                    self.weatherResults = json
                    self.posts = json.weather
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
