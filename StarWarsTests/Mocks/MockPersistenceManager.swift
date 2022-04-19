//
//  MockPersistenceManager.swift
//  StarWarsTests
//
//  Created by Shalom Owolabi on 19/04/2022.
//

import Foundation
@testable import StarWars

final class MockPersistenceManager: FileManagerServiceProtocol {
    
    var wasPersistDataCalled = false
    func persistData(dataToSave: Data, path: URLExtensions) {
        wasPersistDataCalled = true
    }
    
    var dataToReturn: Data?
    var wasLoadDataCalled = false
    
    func loadPersistedData(path: URLExtensions) -> Data? {
        wasLoadDataCalled = true
        return dataToReturn
    }
    
}
