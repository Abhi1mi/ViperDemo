//
//  view.swift
//  viperDemo
//
//  Created by Matrix on 18/07/23.
//

import UIKit

protocol ImageViewProtocol: AnyObject {
    func showImages(_ images: [URL])
    func showImageDetails(for imageURL: URL)
}


class ImageViewController: UIViewController {
    var presenter: ImagePresenterProtocol?
    
    var tableView: UITableView!
    
    private var images: [URL] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Image Gallery"
        setupTableView()
        presenter?.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ImageCell")
        view.addSubview(tableView)
    }
}

extension ImageViewController: ImageViewProtocol {
    func showImageDetails(for imageURL: URL) {
        let alertController = UIAlertController(title: "Image Details", message: imageURL.absoluteString, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showImages(_ images: [URL]) {
        self.images = images
        tableView.reloadData()
    }
}

extension ImageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
        cell.textLabel?.text = "Image \(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectImage(at: indexPath.row)
    }
}
