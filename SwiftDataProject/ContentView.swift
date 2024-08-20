//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Apple on 15/08/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingUpComingOnly = false
    //Make a User array
    
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    var body: some View {
        NavigationStack {
            UserView(minimumJoinDate: showingUpComingOnly ? .now : .distantPast, sortOrder: sortOrder)
                .navigationTitle("Users")
                .toolbar {
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        
                        Button {
                            try? modelContext.delete(model: User.self)
                            
                            let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                            let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                            let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                            let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                            
                            modelContext.insert(first)
                            modelContext.insert(second)
                            modelContext.insert(third)
                            modelContext.insert(fourth)
                        } label: {
                            Label("Add", systemImage: "plus")
                        }
                        
                        
                        Button(showingUpComingOnly ? "Showing Everyone" : "Showing Upcoming") {
                            showingUpComingOnly.toggle()
                        }
                        
                        Menu("Sort", systemImage: "arrow.up.arrow.down") {
                            Picker("Sort", selection: $sortOrder) {
                                Text("Sort by name")
                                    .tag ([
                                        SortDescriptor(\User.name),
                                        SortDescriptor(\User.joinDate)
                                    ])
                                
                                Text("Sort by date")
                                    .tag([
                                        SortDescriptor(\User.joinDate),
                                        SortDescriptor(\User.name)
                                    ])
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self)
}
