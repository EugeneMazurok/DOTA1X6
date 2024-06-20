//
//  LeaderboardTable.swift
//  dota1x6
//
//  Created by Евгений Мазурок on 18.06.2024.
//

import Foundation
import UIKit

class LeaderboardTable: UITableView, UITableViewDataSource, UITableViewDelegate {
    
   let headerView = UIView()
   let cellReuseIdentifier = "LeaderboardCell"
   var data: [[String]] = [] {
       didSet {
           self.reloadData()
       }
   }
   
   init() {
       super.init(frame: .zero, style: .plain)
       
       self.dataSource = self
       self.delegate = self
       self.register(LeaderboardCell.self, forCellReuseIdentifier: cellReuseIdentifier)
       setupTableHeaderView()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   // MARK: - UITableViewDataSource
   
   func tableView(_ tableView: UITableView, 
                  numberOfRowsInSection section: Int) -> Int {
    data.count
   }
   
   func tableView(_ tableView: UITableView, 
                  cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, 
                                                      for: indexPath) as? LeaderboardCell else {
           return UITableViewCell()
       }
       
       let rowData = data[indexPath.row]
       cell.column1Label.text = rowData[0]
       cell.column2Label.text = rowData[1]
       cell.column3Label.text = rowData[2]
       cell.column4Label.text = rowData[3]
       cell.column5Label.text = rowData[4]
       
       return cell
   }
    
    private func setupTableHeaderView() {
        headerView.backgroundColor = .white
        
        let column1Label = UILabel()
        let column2Label = UILabel()
        let column3Label = UILabel()
        let column4Label = UILabel()
        let column5Label = UILabel()
        
        // swiftlint: disable cyrillic_strings
        column1Label.text = "Место"
        column2Label.text = "Игрок"
        column3Label.text = "Рейтинг"
        column4Label.text = "Игр за сезон"
        column5Label.text = "Лучший герой"
        // swiftlint: enable cyrillic_strings
        
        column1Label.translatesAutoresizingMaskIntoConstraints = false
        column2Label.translatesAutoresizingMaskIntoConstraints = false
        column3Label.translatesAutoresizingMaskIntoConstraints = false
        column4Label.translatesAutoresizingMaskIntoConstraints = false
        column5Label.translatesAutoresizingMaskIntoConstraints = false
        
        column1Label.numberOfLines = 0
        column3Label.numberOfLines = 0
        column4Label.numberOfLines = 0
        column5Label.numberOfLines = 0
        
        column1Label.textAlignment = .center
        column2Label.textAlignment = .center
        column3Label.textAlignment = .center
        column4Label.textAlignment = .center
        column5Label.textAlignment = .center
        
        headerView.addSubview(column1Label)
        headerView.addSubview(column2Label)
        headerView.addSubview(column3Label)
        headerView.addSubview(column4Label)
        headerView.addSubview(column5Label)
        
        NSLayoutConstraint.activate([
            // Первый столбик
            column1Label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            column1Label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            column1Label.widthAnchor.constraint(equalToConstant: 52), // Ширина для трехзначного числа
            // Второй столбик
            column2Label.leadingAnchor.constraint(equalTo: column1Label.trailingAnchor, constant: 8),
            column2Label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
            column2Label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8),
            // Третий столбик
            column3Label.leadingAnchor.constraint(equalTo: column2Label.trailingAnchor, constant: 8),
            column3Label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            column3Label.widthAnchor.constraint(equalToConstant: 65), // Ширина для четырехзначного числа
            
            // Четвертый столбик
            column4Label.leadingAnchor.constraint(equalTo: column3Label.trailingAnchor, constant: 8),
            column4Label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            column4Label.widthAnchor.constraint(equalToConstant: 60), // Ширина для четырехзначного числа
            // Пятый столбик
            column5Label.leadingAnchor.constraint(equalTo: column4Label.trailingAnchor, constant: 8),
            column5Label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            column5Label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            column5Label.widthAnchor.constraint(equalToConstant: 65) // Ширина для четырехзначного числа
        ])
        
        headerView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 44)
        self.tableHeaderView = headerView
    }
   
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       87
   }
}
