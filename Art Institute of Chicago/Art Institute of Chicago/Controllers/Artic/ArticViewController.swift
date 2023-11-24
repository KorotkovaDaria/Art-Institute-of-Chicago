//
//  ArticViewController.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//

import UIKit

class ArticViewController: BaseController {
    let articImageArr = ["Artic1","Artic2","Artic3","Artic4","Artic5","Artic6","Artic7","Artic8","Artic9","Artic10"]

    override func viewDidLoad() {
        super.viewDidLoad()
                view.addSubview(tableView)
                tableView.delegate = self
                tableView.dataSource = self
                configoTableView(tableView)
        
        
        APIArticManager.shared.getInfo { [weak self] i in
            DispatchQueue.main.async {
                guard let self else { return }
                self.articTitle = i
                self.tableView.reloadData()
            }
        }
        func configoTableView(_ tabelView: UITableView){
            
            tableView.register(ArticCustomCell.self,forCellReuseIdentifier: "cell")
            tableView.backgroundColor = .clear
            tableView.rowHeight = 207
            tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 106),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        
        
    
}
    //MARK: - Private properties
    private lazy var tableView = UITableView()
    private var articTitle: [Datum] = []
    private let cellSpacingHeight: CGFloat = 16
    //private var galleryImage: String = ""
}

extension ArticViewController: UITableViewDataSource, UITableViewDelegate {
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
