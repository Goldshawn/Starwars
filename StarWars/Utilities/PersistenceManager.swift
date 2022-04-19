//
//  PersistenceManager.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import Foundation
import OSLog

protocol FileManagerServiceProtocol {
    func persistData(dataToSave: Data, path: URLExtensions)
    func loadPersistedData(path: URLExtensions) -> Data?
}

struct PersistenceManager: FileManagerServiceProtocol {
    private static func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func persistData(dataToSave: Data, path: URLExtensions) {
        let file = PersistenceManager.documentsDirectory().appendingPathComponent(path.rawValue)
        do {
            try dataToSave.write(to: file)
            os_log("Data successfully saved.", log: OSLog.default, type: .info)
        } catch let errors{
            print(errors, "mana")
            os_log("Failed to save information...", log: OSLog.default, type: .error)
        }
    }
    
    func loadPersistedData(path: URLExtensions) -> Data? {
        let filePath = PersistenceManager.documentsDirectory().appendingPathComponent(path.rawValue)
        do {
            let loadedData = try Data(contentsOf: filePath)
            return loadedData
        } catch let errors{
            print(errors)
            os_log("Failure to load information...", log: OSLog.default, type: .error)
        }
        return nil
    }
}
