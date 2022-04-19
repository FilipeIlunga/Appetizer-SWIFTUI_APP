//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by DEV on 19/04/22.
//

import SwiftUI

struct AppetizerDetailView: View {
    @Binding var isShowDetail: Bool
    var appetizer: Appetizer 
    var body: some View {
        VStack {
           
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame( width: 300, height: 225)
                            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
            }

            HStack ( spacing: 40){
                AppetizerInfo(type: "Calories", value: "\(appetizer.calories)")
                AppetizerInfo(type: "Carbs", value: "\(appetizer.carbs) g")
                AppetizerInfo(type: "Protein", value: "\(appetizer.protein) g")
            }
            
            Spacer()
            
            Button {
                print("Tapped")
            } label: {
                AddOrderView(text: "$\(appetizer.price) - Add To Order")
            }
            Spacer()
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowDetail = false
            } label: {
             
                Image(systemName: "xmark.circle.fill")
                .resizable()
                .frame(width: 25, height: 25)
                    .symbolRenderingMode(.palette)
                .foregroundStyle(.black, .white)
                .opacity(0.5)
                .padding(.all, 8)
                
            }
        }
    }
}

struct AppetizerInfo: View {
    var type: String
    var value: String
    var body: some View {
        VStack {
            Text(type)
                .font(.footnote)
            Text("\(value)")
                .italic()
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }
    }
}

struct AddOrderView: View {
    var text: String
    var body: some View {
        
        Text(text)
            .font(.title3)
            .fontWeight(.bold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)

    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(isShowDetail: .constant(true), appetizer: MockData.sampleApptezier)
    }
}
