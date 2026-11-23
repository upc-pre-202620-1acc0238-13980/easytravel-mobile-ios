//
//  DestinatonWrapperDto.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 20/11/26.
//

struct DestinatonsWrapperDto: Decodable {
    let count: Int
    let destinations: [DestinationDto]
    
    enum CodingKeys: String, CodingKey {
        case count
        case destinations = "results"
    }
}
