import Alamofire
import UIKit

class ViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("main thread: \(Thread.isMainThread)")
        
        let baseUrl: String = "https://api.trakt.tv/"
        
        let endpoint: String = "movies/trending"
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "trakt-api-version": "2",
            "trakt-api-key": "a5b34b43f36a3727083e7a520206ea3ee08cd7fc3e2633ca501690344e486e1d"
        ]
        
        Alamofire.request("\(baseUrl)\(endpoint)", headers: headers)        // method defaults to GET
            .responseJSON { response in
                print("Request: \(String(describing: response.request))")   // original url request
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result)")                         // response serialization result
                
                if let json = response.result.value {
                    print("JSON: \(json)") // serialized json response
                }
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)") // original server data as UTF8 string
                }
                
                print("main thread: \(Thread.isMainThread)")
            }
        
    }

}

