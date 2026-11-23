//
//  DestinationMapper.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 20/11/26.
//

extension DestinationDto {
    
    func toDomain() -> Destination {
        return Destination(id: id,
                           title: title,
                           city: city,
                           country: country,
                           poster: poster)
    }
}
