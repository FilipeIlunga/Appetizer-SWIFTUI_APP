//
//  RemoteImage.swift
//  Appetizers
//
//  Created by DEV on 19/04/22.
//

import SwiftUI

//Carregar a imagem da API
final class ImageLoader: ObservableObject {
   @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else {return}
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

//A imagem em si
struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

//Recebe e exibe a imagem remota da url
struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                // Quando aparecer a view, faz o request na API
                imageLoader.load(fromURLString: urlString)
            }
    }
}
