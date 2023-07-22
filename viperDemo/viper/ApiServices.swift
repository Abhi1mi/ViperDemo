//
//  ApiServices.swift
//  viperDemo
//
//  Created by Matrix on 22/07/23.
//
import Foundation

protocol ApiServiceProtocol {
    func fetchImageURLs(completion: @escaping ([URL]) -> Void)
    func getImageURL(at index: Int) -> URL?
}

class ApiService: ApiServiceProtocol {
    private let imageUrls: [URL] = [
        URL(string: "https://example.com/image1.jpg")!,
        URL(string: "https://example.com/image2.jpg")!,
        URL(string: "https://example.com/image3.jpg")!,
        // Add more image URLs as needed
    ]

    func fetchImageURLs(completion: @escaping ([URL]) -> Void) {
        // Simulate API call delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            completion(self.imageUrls)
        }
    }

    func getImageURL(at index: Int) -> URL? {
        guard index >= 0 && index < imageUrls.count else {
            return nil
        }
        return imageUrls[index]
    }
}
