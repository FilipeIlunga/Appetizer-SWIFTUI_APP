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
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthday,displayedComponents: .date)
                        .pickerStyle(.segmented)
                    
                    Button {
                       viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                Section(header: Text("REQUESTS")) {
                    APToggle(isOn: $viewModel.user.extraNapkins, title: "Extra Napkins")
                    APToggle(isOn: $viewModel.user.frequentRefills, title: "Frequent Refills")
                }
            }.navigationTitle("Account")
        }
        .onAppear{
            viewModel.retriveUser()
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
