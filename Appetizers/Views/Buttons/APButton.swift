//
//  APButton.swift
//  Appetizers
//
//  Created by DEV on 19/04/22.
//

import SwiftUI

struct APButton: View {
    let title: String
    var body: some View {
        
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)

    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "This is a button")
    }
}
