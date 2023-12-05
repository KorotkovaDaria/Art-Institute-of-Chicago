//
//  ArticView.swift
//  Art Institute of Chicago
//
//  Created by Daria on 27.11.2023.
//
import UIKit

class ArticleView: UIView {
    var articleData: [ArticDatum] = []
    lazy var tableView = UITableView()
    
    //MARK: - Private properties
    private let cellSpacingHeight: CGFloat = 16 // Расстояние между ячейками
    private let articleImageNames = ["Artic1","Artic2","Artic3","Artic4","Artic5","Artic6","Artic7","Artic8","Artic9","Artic10"]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Настройка article view
    private func configure() {
        setBackgroundColor() // Вызов отдельного метода для настройки цвета фона
        addSubview(tableView)
        setupTableView()
    }
    
    private func setBackgroundColor() {
        backgroundColor = UIColor(named: Resources.Colors.beige)
    }
    // Настройка table view
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        configureTableView()
    }
    // Настройка свойств tableView
    private func configureTableView() {
        tableView.register(ArticCustomCell.self,forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(named:Resources.Colors.beige)
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
// MARK: - UITableViewDataSource, UITableViewDelegate extension
extension ArticleView: UITableViewDataSource, UITableViewDelegate {
    // Настройка ячейки по определенному индексу
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticCustomCell
        let textValue = articleData[indexPath.section]
        let imageIndex = indexPath.section % articleImageNames.count
        cell.articImageBacground.image = UIImage(named: articleImageNames[imageIndex])
        cell.articLabel.text = "\(textValue.title)"
        return cell
    }
    // Количество разделов
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleData.count
    }
    // Количество строк в разделе
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    // Высота заголовка в разделе
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    // Кастомный вид заголовка в разделе
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


