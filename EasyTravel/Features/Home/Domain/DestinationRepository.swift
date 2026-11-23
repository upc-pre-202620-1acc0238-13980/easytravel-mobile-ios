//
//  DestinationRepository.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 20/11/26.
//

protocol DestinationRepository {
    func getDestinatiosn() async throws -> [Destination]
}
