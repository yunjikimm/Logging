//
//  HomeViewExtension.swift
//  Logging
//
//  Created by yunjikim on 2023/02/13.
//

import Foundation
import UIKit

extension HomeViewController {
    
    // MARK: extension - table cell
    // cell 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.contentObject.count == 0 {
            self.tableView.backgroundView = EmptyLogTableViewCell()
            self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
            return 0
        } else {
            self.tableView.backgroundView = nil
            return self.contentObject.count
        }
    }
    
    // 각 cell에 대한 설정
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell에 대한 인스턴스 생성 - dequeueReusableCell 재사용 셀
        // as! : 자료형 강제 정의
        let cell = logTableView.dequeueReusableCell(withIdentifier: LogTableViewCell.tableViewCellID, for: indexPath) as! LogTableViewCell
        
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "yyyy/MM/dd"
        
        cell.titleLabel.text = contentObject[indexPath.row].title
        cell.contentLabel.text = contentObject[indexPath.row].content
        
        if let updatedDate = contentObject[indexPath.row].updatedAt {
            let dateString = dataFormatter.string(from: updatedDate)
            cell.updatedAtLabel.text = String(describing: dateString)
        }

        cell.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        return cell
    }
    
    // cell 스와이프
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // 수정
        let modifyCellActionButton = UIContextualAction(style: .normal, title: "수정", handler: { action, view, completionHandler in
            
            VIEWCONTROLLER.MODIFY.contentList = Content(
                _id: self.contentObject[indexPath.row]._id,
                title: self.contentObject[indexPath.row].title!,
                content: self.contentObject[indexPath.row].content!,
                createdAt: self.contentObject[indexPath.row].createdAt!,
                updatedAt: self.contentObject[indexPath.row].updatedAt!
            )
            
            VIEWCONTROLLER.MODIFY.modalPresentationStyle = .fullScreen
            self.present(VIEWCONTROLLER.MODIFY, animated: true, completion: nil)
            
        })
        
        // 삭제
        let deleteCellActionButton = UIContextualAction(style: .normal, title: "삭제", handler: { action, view, completionHandler in
            
            ContentDataService.shared.deleteContent(self.contentObject[indexPath.row])
            
        })
        
        // button backgroundColor
        modifyCellActionButton.backgroundColor = .systemBlue
        deleteCellActionButton.backgroundColor = .systemRed
        
        let config = UISwipeActionsConfiguration(actions: [modifyCellActionButton, deleteCellActionButton])
        config.performsFirstActionWithFullSwipe = false
        
        return config
    }
    
    // MARK: extension - tableview header view
    // tableview haeder view
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = logTableView.dequeueReusableHeaderFooterView(withIdentifier: LogTableViewHeaderView.headerViewID) as! LogTableViewHeaderView

        headerView.logoLabel.text = LogTableViewHeaderView.logoText

        let backgroundView = UIView(frame: headerView.bounds)
        headerView.backgroundView = backgroundView

        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return LogTableViewHeaderView.tableViewInitHeight
    }
    
}
