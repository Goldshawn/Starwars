//
//  InformationViewModel.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import SwiftUI
import OSLog

class InformationViewModel: ObservableObject {
    
    @Published var people: PeopleModel?
    @Published var planets: PlanetsModel?
    @Published var vehicles: VehiclesModel?
    @Published var films: FilmsModel?
    @Published var species: SpeciesModel?
    @Published var starships: StarShipsModel?
    
    var networkData: NetworkServiceProtocol
    var persistData: FileManagerServiceProtocol
    
    init(_ networkData: NetworkServiceProtocol, _ persistData: FileManagerServiceProtocol) {
        self.networkData = networkData
        self.persistData = persistData
    }
    
    func fetch(with urlExtention: URLExtensions) {
        switch urlExtention {
        case .planets:
            networkData.getPlanetInformation { dataFromNetwork in
                self.sortNetworkData(dataFromNetwork, urlExtention: urlExtention)
            }
        case .starships:
            networkData.getStarshipInformation { dataOfStarShip in
                self.sortNetworkData(dataOfStarShip, urlExtention: urlExtention)
            }
        case .vehicles:
            networkData.getVehicleInformation { dataOfVehicles in
                self.sortNetworkData(dataOfVehicles, urlExtention: urlExtention)
            }
        case .people:
            networkData.getPeopleInformation { dataOfPeople in
                self.sortNetworkData(dataOfPeople, urlExtention: urlExtention)
            }
        case .films:
            networkData.getFilmsInformation { dataOfFilms in
                self.sortNetworkData(dataOfFilms, urlExtention: urlExtention)
            }
        case .species:
            networkData.getSpeciesInformation { dataOfSpecies in
                self.sortNetworkData(dataOfSpecies, urlExtention: urlExtention)
            }
        }
    }
    
    func loadFromMemory(with urlExtention: URLExtensions){
//        let memoryData = PersistenceManager().loadPersistedData(path: urlExtention)
        let memoryData = persistData.loadPersistedData(path: urlExtention)
        if let memoryData = memoryData {
            do {
                switch urlExtention {
                case .planets:
                    let memoryDataDecoded = try JSONDecoder().decode(PlanetsModel.self, from: memoryData)
                    self.planets = memoryDataDecoded
                case .starships:
                    let memoryDataDecoded = try JSONDecoder().decode(StarShipsModel.self, from: memoryData)
                    self.starships = memoryDataDecoded
                case .vehicles:
                    let memoryDataDecoded = try JSONDecoder().decode(VehiclesModel.self, from: memoryData)
                    self.vehicles = memoryDataDecoded
                case .people:
                    let memoryDataDecoded = try JSONDecoder().decode(PeopleModel.self, from: memoryData)
                    self.people = memoryDataDecoded
                case .films:
                    let memoryDataDecoded = try JSONDecoder().decode(FilmsModel.self, from: memoryData)
                    self.films = memoryDataDecoded
                case .species:
                    let memoryDataDecoded = try JSONDecoder().decode(SpeciesModel.self, from: memoryData)
                    self.species = memoryDataDecoded
                }
            } catch let errors {
                print(errors)
                os_log("Failed to load information...", log: OSLog.default, type: .error)
            }
        }
        fetch(with: urlExtention)
    }
    
    fileprivate func sortNetworkData<T: Codable>(_ data: Result<T, NetworkError>, urlExtention: URLExtensions) {
        DispatchQueue.main.async {
            switch data {
            case .success(let dataInfo):
                switch urlExtention {
                case .planets:
                    self.planets = dataInfo as? PlanetsModel
                case .starships:
                    self.starships = dataInfo as? StarShipsModel
                case .vehicles:
                    self.vehicles = dataInfo as? VehiclesModel
                case .people:
                    self.people = dataInfo as? PeopleModel
                case .films:
                    self.films = dataInfo as? FilmsModel
                case .species:
                    self.species = dataInfo as? SpeciesModel
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
