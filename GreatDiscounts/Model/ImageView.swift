//
//  ImageView.swift
//  GreatDiscounts
//
//  Created by Valerii D on 17.07.2021.
//

import UIKit

class ImageView: UIImageView {

    func fetchImage(with url: String?) {
        
        guard let url = url else { return }
        guard let imageUrl = URL(string: url) else {
            // если неверный URL адрес устанавливаем картинку по молчанию
            image = UIImage(systemName: "doc")
            return
        }
        
        // если изображение есть в кэше то используем его и выходим из функции
        if let cachedImage = getCachedImage(url: imageUrl) {
            image = cachedImage
            return
        }
        
        // загружаем изображения с интернета и сохраняем их в кэш
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data, let response = response else { return }
            guard let responseUrl = response.url else { return }
            
            guard imageUrl == responseUrl else { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
            self.saveImageToCache(data: data, response: response)
            
        }.resume()
        
        
    }
    
    // создаем URL запрос в кэш, если картинка есть кэшe то мы её возвращаем
    func getCachedImage(url: URL) -> UIImage? {
        let urlRequest = URLRequest(url: url)
        if let cacheResponnse = URLCache.shared.cachedResponse(for: urlRequest) {
            return UIImage(data: cacheResponnse.data)
        }
        return nil
    }
    
    // сохраняем изображения в кэш
    func saveImageToCache(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let urlRequest = URLRequest(url: responseURL)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
    }
}
