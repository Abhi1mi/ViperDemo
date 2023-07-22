//
//  presenter.swift
//  viperDemo
//
//  Created by Matrix on 18/07/23.
//
import Foundation

protocol ImagePresenterProtocol {
    var view: ImageViewProtocol? { get set } 
    func viewDidLoad()
    func didSelectImage(at index: Int)
}

class ImagePresenter: ImagePresenterProtocol {
    weak var view: ImageViewProtocol?
    var interactor: ImageInteractorProtocol?
    var router: ImageRouterProtocol?

    func viewDidLoad() {
        interactor?.fetchImages()
    }

    func didSelectImage(at index: Int) {
        if let imageURL = interactor?.getImageURL(at: index) {
            view?.showImageDetails(for: imageURL)
        }
    }
}

extension ImagePresenter: ImageInteractorOutputProtocol {
    func imagesFetched(_ images: [URL]) {
        view?.showImages(images)
    }
}
