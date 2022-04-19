//
//  NetworkServiceProtocol.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import Foundation

///This protocal helps facilitate network operationsi.e. API and web services
protocol NetworkServiceProtocol {
    
    ///This function is called to get planetDetails, returns the approprait detail in response or Network Error
    func getPlanetInformation(completion: @escaping((Result<PlanetsModel, NetworkError>) -> Void))
    
    ///This function is called to get vehicleDetail, returns the approprait detail in response or Network Error
    func getVehicleInformation(completion: @escaping((Result<VehiclesModel, NetworkError>) -> Void))
    
    ///This function is called to get filmDetail, returns the approprait detail in response or Network Error
    func getFilmsInformation(completion: @escaping((Result<FilmsModel, NetworkError>) -> Void))
    
    ///This function is called to get speciesDetail, returns the approprait detail in response or Network Error
    func getSpeciesInformation(completion: @escaping((Result<SpeciesModel, NetworkError>) -> Void))
    
    ///This function is called to get starshipDetail, returns the approprait detail in response or Network Error
    func getStarshipInformation(completion: @escaping((Result<StarShipsModel, NetworkError>) -> Void))
    
    ///This function is called to get peopleDetails, returns the appropraite detail in response or Network Error
    func getPeopleInformation(completion: @escaping((Result<PeopleModel, NetworkError>) -> Void))
}
