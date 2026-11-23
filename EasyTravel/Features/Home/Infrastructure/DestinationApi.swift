//
//  DestinationApi.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 20/11/26.
//

import Foundation

class DestinationApi {
    
    private let baseUrl = "https://destinationapp-h4e8dvace3fqffbb.eastus-01.azurewebsites.net/api/destinations"
    
    func getDestinations() async throws -> [DestinationDto] {
        guard let url = URL(string: baseUrl) else {
            throw NetworkError.invalidUrl
        }
        
        let session = URLSession.shared
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let wrapperDto = try JSONDecoder().decode(DestinatonsWrapperDto.self, from: data)
            return wrapperDto.destinations
        } catch {
            throw NetworkError.decodingError
        }
        
    }
}

enum NetworkError: Error {
    case invalidUrl
    case invalidResponse
    case decodingError
}
