//
//  MainTableViewTitleCell.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/17.
//

import UIKit

protocol MainTableViewTitleDelegate: AnyObject {
    func addDiary()
    func showAlert()
    func showProfile()
}

class MainTableViewTitleCell: UITableViewCell {
    weak var delegate: MainTableViewTitleDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func touchAddDiaryButton(_ sender: Any) {
        delegate?.addDiary()
    }
    @IBAction func touchAlertButton(_ sender: Any) {
        delegate?.showAlert()
    }
    @IBAction func touchProfileButton(_ sender: Any) {
        delegate?.showProfile()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
