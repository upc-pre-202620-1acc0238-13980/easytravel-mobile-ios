//
//  AppContainer.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 20/11/26.
//

class AppContainer {
    
    private lazy var api = DestinationApi()
    
    private lazy var dao = FavoriteDao()
    
    private lazy var repository: any DestinationRepository = {
        DestinationRepositoryImpl(api: api)
    }()
    
    
    private lazy var favoriteRepository: any FavoriteRepository = {
        FavoriteRepositoryImpl(dao: dao)
    }()
    func makeHomeViewModel() -> HomeViewModel {
        let getDestinations = GetDestinationsUseCase (repository: repository)
        let getFavorites = GetFavoritesUseCase(repository: favoriteRepository)
        let toggleFavorite = ToggleFavoriteUseCase(repository: favoriteRepository)
        return HomeViewModel(getDestinations: getDestinations, getFavorites: getFavorites, toggleFavorite: toggleFavorite)
    }
}
