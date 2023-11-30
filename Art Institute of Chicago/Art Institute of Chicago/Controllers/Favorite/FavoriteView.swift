//
//  FavoriteView.swift
//  Art Institute of Chicago
//
//  Created by Daria on 27.11.2023.
//
import UIKit

class FavoriteView: UIView {
        var favoriteData: [ArticDatum] = []
        lazy var favoriteTableView = UITableView()
        
        //MARK: - Private properties
        private let cellSpacingHeight: CGFloat = 4

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
                favoriteTableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 106),
                favoriteTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
                favoriteTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
                favoriteTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        }
    }

extension FavoriteView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoriteCustomCell
            cell.favoriteImage.image = UIImage(named: "Artic1")
            cell.favoriteArtistLabel.text = "Ivan Ivanov"
            cell.favoriteTitleLabel.text = "Favorite Label Title"
            return cell
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 10
        }
        
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//                return 1
//            }
//
//        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//                return cellSpacingHeight
//            }
//
//        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//                let headerView = UIView()
//                headerView.backgroundColor = UIColor.clear
//                return headerView
//            }
    }


