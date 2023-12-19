//
//  DetailArticViewConnroller.swift
//  Art Institute of Chicago
//
//  Created by Daria on 27.11.2023.
//

import UIKit

class DetailArticViewController: UIViewController {
    private let articDatum: ArticDatum
    
    init(articDatum: ArticDatum) {
        self.articDatum = articDatum
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: Resources.Colors.beige)
        
        // Создаем UIScrollView
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        // Создайте и настройте интерфейс для отображения данных
        let titleLabel = UILabel()
        titleLabel.text = articDatum.title
        titleLabel.font = UIFont(name: Resources.Fonts.emilea, size: 36)
        titleLabel.textColor = UIColor(named: Resources.Colors.pink)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let copyLabel = UILabel()
        copyLabel.text = articDatum.copy
        copyLabel.textColor = UIColor(named: Resources.Colors.dark)
        copyLabel.font = UIFont(name: Resources.Fonts.montserratRegular, size: 16)
        copyLabel.numberOfLines = 0
        copyLabel.lineBreakMode = .byWordWrapping
        copyLabel.textAlignment = .justified
        copyLabel.translatesAutoresizingMaskIntoConstraints = false
    
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(copyLabel)
        
        
        let titleLabelHeight = titleLabel.systemLayoutSizeFitting(
            CGSize(width: 359, height: UIView.layoutFittingCompressedSize.height)
        ).height
        
        let copyLabelHeight = copyLabel.systemLayoutSizeFitting(
            CGSize(width: 356, height: UIView.layoutFittingCompressedSize.height)
        ).height
        
        // Активируем constraints для UIScrollView
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        // Активируем constraints для titleLabel и copyLabel внутри UIScrollView
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: 359),
            titleLabel.heightAnchor.constraint(equalToConstant: titleLabelHeight),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 14),
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 56),
            copyLabel.widthAnchor.constraint(equalToConstant: 356),
            copyLabel.heightAnchor.constraint(equalToConstant: copyLabelHeight),
            copyLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 14),
            copyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            copyLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10)
        ])
        
        let closeButton = UIButton(type: .system)
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeButton.tintColor = UIColor(named: Resources.Colors.pink)

        // Добавьте целевой метод для обработки нажатия кнопки
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)

        // Добавьте кнопку к представлению вашего контроллера
        scrollView.addSubview(closeButton)

        // Настройте ограничения (constraints) для кнопки
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
    }

    // Метод для обработки нажатия кнопки "Закрыть"
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}


