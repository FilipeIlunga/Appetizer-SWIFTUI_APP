//
//  AccountView.swift
//  Appetizers
//
//  Created by DEV on 16/04/22.
//

import SwiftUI

struct AccountView: View {
    @State var extraNapkins: Bool = true
    @State var frequentRefills: Bool = false
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var birthday: Date = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("PERSONAL INFO")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthday", selection: $birthday,displayedComponents: .date)
                        .pickerStyle(.segmented)
                    
                    Button {
                        print("Tapped")
                    } label: {
                        Text("Save Changes")
                    }
                        
                }
                
                Section(header: Text("REQUESTS")) {
                    APToggle(isOn: $extraNapkins, title: "Extra Napkins")
                    APToggle(isOn: $frequentRefills, title: "Frequent Refills")
                }
            }.navigationTitle("Account")
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
