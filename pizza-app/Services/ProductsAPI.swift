
import Foundation

// https://apingweb.com/api/rest/93be2cd6354a3b96cdc845a53920d1cc8/product-API

enum NetworkError: Error {
    case urlInvalid
    case dataError
}

class ProductsAPI {
    
    func fetchProductsAsync() async throws -> [Product] {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "apingweb.com"
        urlComponents.path = "/api/rest/93be2cd6354a3b96cdc845a53920d1cc8/product-API"
        
        guard let url = urlComponents.url else { throw NetworkError.urlInvalid }
        
        let session = URLSession(configuration: .default)
        
        var reqest = URLRequest(url: url)
        reqest.httpMethod = "GET"
        
        let decoder = JSONDecoder()
        
        do {
            let (data, response) = try await session.data(for: reqest)
            print(response)
            
            let jsonResponse = try decoder.decode(ProductResponse.self, from: data)
            return jsonResponse.products
        } catch {
            print(error)
            throw NetworkError.dataError
        }
    }
}

