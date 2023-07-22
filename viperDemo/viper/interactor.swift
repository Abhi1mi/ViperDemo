//
//  interactor.swift
//  viperDemo
//
//  Created by Matrix on 18/07/23.
//

import Foundation

protocol ImageInteractorProtocol {
    var presenter: ImageInteractorOutputProtocol? { get set }
    func fetchImages()
    func getImageURL(at index: Int) -> URL?
}

protocol ImageInteractorOutputProtocol: AnyObject {
    func imagesFetched(_ images: [URL])
}

class ImageInteractor: ImageInteractorProtocol {
    weak var presenter: ImageInteractorOutputProtocol?
    private let apiService: ApiServiceProtocol

    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }

    func fetchImages() {
        apiService.fetchImageURLs { [weak self] urls in
            DispatchQueue.main.async {
                self?.presenter?.imagesFetched(urls)
            }
        }
    }

    func getImageURL(at index: Int) -> URL? {
        // In a real app, you'd have an array of image URLs or some data model containing the image URLs.
        // For simplicity, we'll assume the URLs are already fetched and stored in the ApiService.
        return apiService.getImageURL(at: index)
    }
}
