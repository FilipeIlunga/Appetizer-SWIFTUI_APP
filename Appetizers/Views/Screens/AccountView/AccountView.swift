//
//  AccountView.swift
//  Appetizers
//
//  Created by DEV on 16/04/22.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel: AccountViewModel = AccountViewModel()
    


    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("PERSONAL INFO")) {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthday", selection: $viewModel.birthday,displayedComponents: .date)
                        .pickerStyle(.segmented)
                    
                    Button {
                       viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                        
                }
                
                Section(header: Text("REQUESTS")) {
                    APToggle(isOn: $viewModel.extraNapkins, title: "Extra Napkins")
                    APToggle(isOn: $viewModel.frequentRefills, title: "Frequent Refills")
                }
            }.navigationTitle("Account")
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct APToggle: View {
    @Binding var isOn: Bool
    let title: String
    var body: some View {
        Toggle(title,isOn: $isOn)
            .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
