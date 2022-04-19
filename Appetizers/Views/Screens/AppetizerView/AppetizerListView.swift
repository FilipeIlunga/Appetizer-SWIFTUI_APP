//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by DEV on 16/04/22.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject private var viewModel = AppetizerViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.isShowDetail = true
                            viewModel.selectedAppetizer = appetizer
                        }
                }
                .navigationTitle("🍊Appetizer")
                .disabled(viewModel.isShowDetail)
            }
            .onAppear {
                viewModel.getAppetizer()
            }
            .blur(radius: viewModel.isShowDetail ? 20 : 0)
            
            
            
            if viewModel.isShowDetail {
                AppetizerDetailView(isShowDetail: $viewModel.isShowDetail, appetizer: viewModel.selectedAppetizer!)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
