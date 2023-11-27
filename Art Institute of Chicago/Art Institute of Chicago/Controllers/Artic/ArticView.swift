//
//  ArticView.swift
//  Art Institute of Chicago
//
//  Created by Daria on 27.11.2023.
//
import UIKit

class ArticView: UIView {
    var articTitle: [Datum] = []
    lazy var tableView = UITableView()
    
    //MARK: - Private properties
    private let cellSpacingHeight: CGFloat = 16
    private let articImageArr = ["Artic1","Artic2","Artic3","Artic4","Artic5","Artic6","Artic7","Artic8","Artic9","Artic10"]
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        backgroundColor = UIColor(named:Resouces.Colors.beige)
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        configureTableView()
    }

    private func configureTableView() {
        tableView.register(ArticCustomCell.self,forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(named:Resouces.Colors.beige)
        tableView.rowHeight = 207
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 106),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension ArticView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticCustomCell
        let textValue = articTitle[indexPath.section]
        let imageIndex = indexPath.section % articImageArr.count
        cell.articImageBacground.image = UIImage(named: articImageArr[imageIndex])
        cell.articLabel.text = "\(textValue.title)"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return cellSpacingHeight
        }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }

}
