//
//  Protocols.swift
//  viperDemo
//
//  Created by Matrix on 18/07/23.
//

import Foundation
import UIKit

   // for view Input
protocol ViewToPresenter {
    var view: PresenterToView? { get set }
    var interactor: PresenterToInteractor? { get set }
    var router: PresenterToRouter? { get set }
    var stubsString: [String]? { get set }
    
    func viewDidLoad()
    func refresh()
    func numOfrowsInsection()-> Int
    
}

  //for view output
protocol PresenterToView {
     func onSuccess()
    func onError(error: String)
}

  //interactor input
protocol PresenterToInteractor {
    var presenter: InteractorToPresenter? { get set }
    func loadData()
}

  //interacor output
protocol InteractorToPresenter {
    func fetchSuccess(data: [String])
    func gotError()
    
}

  //router input
protocol PresenterToRouter {
    static func createModule() -> UINavigationController
    func pushTodetails(onView: PresenterToView, withData: String)
}
