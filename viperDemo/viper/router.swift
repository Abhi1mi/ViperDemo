//
//  router.swift
//  viperDemo
//
//  Created by Matrix on 18/07/23.
//
import UIKit

protocol ImageRouterProtocol {
    static func createModule() -> UIViewController
    func navigateToImageDetails(with imageURL: URL)
}

class ImageRouter: ImageRouterProtocol {
    static func createModule() -> UIViewController {
        let view = ImageViewController()
        let presenter: ImagePresenter = ImagePresenter()
        var interactor: ImageInteractorProtocol = ImageInteractor(apiService: ApiService())
        let router: ImageRouterProtocol = ImageRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        return view
    }

    func navigateToImageDetails(with imageURL: URL) {
        // Implement navigation to image details view here (if needed).
        // This is just a placeholder to show the navigation.
        print("Navigating to image details with URL: \(imageURL)")
    }
}
