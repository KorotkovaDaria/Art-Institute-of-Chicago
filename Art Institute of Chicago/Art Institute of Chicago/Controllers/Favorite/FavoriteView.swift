//
//  FavoriteView.swift
//  Art Institute of Chicago
//
//  Created by Daria on 27.11.2023.
//
import UIKit

class FavoriteView: UIView {
        var favoriteData: [GalleryDatum] = []
        lazy var favoriteTableView = UITableView()

    override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func configure() {
            backgroundColor = UIColor(named:Resources.Colors.beige)
            addSubview(favoriteTableView)
            favoriteTableView.delegate = self
            favoriteTableView.dataSource = self
            configureTableView()
        }

        private func configureTableView() {
            favoriteTableView.register(FavoriteCustomCell.self,forCellReuseIdentifier: "cell")
            favoriteTableView.backgroundColor = .clear
            favoriteTableView.rowHeight = 53
            favoriteTableView.layer.cornerRadius = 10
            favoriteTableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                favoriteTableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 86),
                favoriteTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
                favoriteTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
                favoriteTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        }
    }

extension FavoriteView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let galleryItem = favoriteData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoriteCustomCell
        if let imageID = galleryItem.imageID {
            APIGalleryManager.shared.getImageData(imageID: imageID) { result in
                switch result {
                case .success(let imageData):
                    DispatchQueue.main.async {
                        cell.favoriteImage.image = UIImage(data: imageData)
                    }
                case .failure(let error):
                    print("Error fetching image data: \(error)")
                }
            }
        } else {
            cell.favoriteImage.image = UIImage(named: "ArtDoesNotPhoto")
        }
        cell.favoriteArtistLabel.text = galleryItem.artistTitle ?? "Unknown Artist"
        cell.favoriteTitleLabel.text = galleryItem.title
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favoriteData.count
    }

}


