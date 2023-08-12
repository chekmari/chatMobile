//
//  UserManager.swift
//  Messenger Project
//
//  Created by macbook on 11.08.2023.
//

import Foundation

class UserManager {
    
    private var existingUsers: [User] = []
    
    init(loadFromFile: Bool = false, fileURL: URL? = nil) {
        if loadFromFile, let fileURL = fileURL {
            do {
                try loadUsers(from: fileURL)
            }
            catch {print("")}
        }
    }
    
    func add(user: User) throws {
        existingUsers.append(user)
    }
    func loadUsers(from fileURL: URL) throws {
        do {
            let data = try Data(contentsOf: fileURL)
            let decodedUsers = try JSONDecoder().decode([User].self,
                                                        from: data)
            existingUsers = decodedUsers
            print("Users loaded from file.")
        }
        catch {
            print("Error loading users: \(error)")
        }
    }
    func saveUsers(to fileURL: URL) throws {
        do {
            let jsonData = try JSONEncoder().encode(existingUsers)
            try jsonData.write(to: fileURL)
            print("Users saved to file.")
        }
        catch {
            print("Error saving users: \(error)")
        }
    }
    func createUser(email: String,
                    password: String,
                    firstName: String,
                    lastName: String,
                    middleName: String,
                    age: String?,
                    country: String?,
                    town: String?) {
        guard let fileURL = FileManager.default.urls(for: .documentDirectory,
                                                     in: .userDomainMask)
            .first?.appendingPathComponent("UsersJSON.json") else {
            return
        }
        var newUser = User(email: email,
                           password: password,
                           firstName: firstName,
                           middleName: middleName,
                           lastName: lastName)
        
        if let ageText = age, !ageText.isEmpty {
            newUser.age = ageText
        }
        if let country = country, !country.isEmpty {
            newUser.country = country
        }
        if let town = town, !town.isEmpty {
            newUser.town = town
        }
            
        do {
            try loadUsers(from: fileURL)
            try add(user: newUser)
            try saveUsers(to: fileURL)
            print("Data written to JSON file.")
        }
        catch {
            print("Error creating user: \(error)")
        }
    }
}
    


