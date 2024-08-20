//
//  EditUserView.swift
//  SwiftDataProject
//
//  Created by Apple on 15/08/2024.
//

import SwiftData
import SwiftUI

struct EditUserView: View {
    @Bindable var user: User
    
    var body: some View {
        Form {
            TextField("Name", text: $user.name)
            TextField("city", text: $user.city)
            DatePicker("Date", selection: $user.joinDate)
        }
        .navigationTitle("EditUser")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let user = User(name: "Connor", city: "Burnaby", joinDate: .now)
        
        return EditUserView(user: user)
            .modelContainer(container)
    } catch {
        return Text("Error \(error.localizedDescription)")
    }
}
