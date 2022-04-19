//
//  NetworkManager.swift
//  Appetizers
//
//  Created by DEV on 16/04/22.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache: NSCache = NSCache<NSString, UIImage>()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer],APError>) -> Void) {
        
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in

            if error != nil {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        //Criando uma chave para a imagem guarda em cache
        let cacheKey: NSString = NSString(string: urlString)
        
        //verificacao se a imagem existe em cache
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { [self] data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                // Se ocorreu algum erro, simplesmente devolve nil e nao trata o erro
                completed(nil)
                return
            }
            
            //Se a imagem foi obtida com sucesso, salva ela em cache e devolve a imagem obtida
            cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
    
}
