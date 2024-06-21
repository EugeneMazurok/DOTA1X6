//
//  LeaderboardCell.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 18.06.2024.
//

import Foundation
import UIKit

class LeaderboardCell: UITableViewCell {
    
    let column1Label = UILabel()
    let column2Label = UILabel()
    let column3Label = UILabel()
    let column4Label = UILabel()
    let column5Label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        column1Label.translatesAutoresizingMaskIntoConstraints = false
        column2Label.translatesAutoresizingMaskIntoConstraints = false
        column3Label.translatesAutoresizingMaskIntoConstraints = false
        column4Label.translatesAutoresizingMaskIntoConstraints = false
        column5Label.translatesAutoresizingMaskIntoConstraints = false
        
        column1Label.textAlignment = .center
        
        column2Label.textAlignment = .left
        column2Label.numberOfLines = 0
        column2Label.lineBreakMode = .byWordWrapping
        
        column3Label.textAlignment = .center
        column4Label.textAlignment = .center
        column5Label.textAlignment = .center
        
        contentView.addSubview(column1Label)
        contentView.addSubview(column2Label)
        contentView.addSubview(column3Label)
        contentView.addSubview(column4Label)
        contentView.addSubview(column5Label)
        
        NSLayoutConstraint.activate([
            // Первый столбик
            column1Label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            column1Label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            column1Label.widthAnchor.constraint(equalToConstant: 55), // Ширина для трехзначного числа
            
            // Второй столбик
            column2Label.leadingAnchor.constraint(equalTo: column1Label.trailingAnchor, constant: 8),
            column2Label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // Третий столбик
            column3Label.leadingAnchor.constraint(equalTo: column2Label.trailingAnchor, constant: 8),
            column3Label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            column3Label.widthAnchor.constraint(equalToConstant: 65), // Ширина для четырехзначного числа
            
            // Четвертый столбик
            column4Label.leadingAnchor.constraint(equalTo: column3Label.trailingAnchor, constant: 8),
            column4Label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            column4Label.widthAnchor.constraint(equalToConstant: 60), // Ширина для четырехзначного числа
            
            // Пятый столбик
            column5Label.leadingAnchor.constraint(equalTo: column4Label.trailingAnchor, constant: 8),
            column5Label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            column5Label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            column5Label.widthAnchor.constraint(equalToConstant: 65) // Ширина для четырехзначного числа
        ])
        
        // Второй столбик занимает оставшееся пространство
        column2Label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        column3Label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        column4Label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        column5Label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
