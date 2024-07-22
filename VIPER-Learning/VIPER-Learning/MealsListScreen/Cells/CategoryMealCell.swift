//
//  CategoryMealCell.swift
//  VIPER-Learning
//
//  Created by Artemio Pánuco on 22/07/24.
//

import Foundation
import UIKit
import Kingfisher

class CategoryMealCell: UITableViewCell {
    static let identifier: String = "CategoryMealCell"
    
    let imageCategory: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelCategoryTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 21, weight: .semibold, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 6
        label.font = .systemFont(ofSize: 12, weight: .regular, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        addSubview(self.imageCategory)
        addSubview(self.labelCategoryTitle)
        addSubview(self.labelDescription)
        configureConstraints()
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            imageCategory.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            imageCategory.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            //imageCategory.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12),
            imageCategory.widthAnchor.constraint(equalToConstant: 100),
            imageCategory.heightAnchor.constraint(equalToConstant: 200),
            
            imageCategory.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12),
            
            labelCategoryTitle.leadingAnchor.constraint(equalTo: imageCategory.trailingAnchor, constant: 18),
            labelCategoryTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            labelCategoryTitle.topAnchor.constraint(equalTo: imageCategory.topAnchor, constant: 8),
            
            labelDescription.leadingAnchor.constraint(equalTo: imageCategory.trailingAnchor, constant: 20),
            labelDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            labelDescription.topAnchor.constraint(equalTo: labelCategoryTitle.bottomAnchor, constant: 8),
            
            labelDescription.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12)
        ])
    }
    
    func configureCell(category: MealCategoryModel) {
        self.imageCategory.kf.setImage(with: category.categoryImage)
        self.labelCategoryTitle.text = category.categoryTitle
        self.labelDescription.text = category.categoryDescription
    }
}
