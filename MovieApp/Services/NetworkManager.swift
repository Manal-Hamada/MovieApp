
import Foundation
import Alamofire


protocol NetworkProtocol {
    func fetchData<T:Decodable>(baseUrl:String,endPoint:EndPoints,compilitionHandler: @escaping (T?) -> Void)
    
}

public class NetworkManager:NetworkProtocol{
    
    let header : HTTPHeaders = ["accept":"application/json"]
    func fetchData<T:Decodable>(baseUrl: String,endPoint:EndPoints, compilitionHandler: @escaping (T?) -> Void) where T : Decodable {
        AF.request("\(baseUrl)\(endPoint.path)\(API_KEY)", method: .get, headers: header).responseDecodable(of:T.self){ response in
            print(response)
            
            do{
                let result = try JSONDecoder().decode(T.self, from: response.data ?? Data())
                debugPrint(result)
                compilitionHandler(result)
            }catch let error {
                print("Network error")
                print(error.localizedDescription)
                print(String(describing: error))
            }
        }
    }
    
}
