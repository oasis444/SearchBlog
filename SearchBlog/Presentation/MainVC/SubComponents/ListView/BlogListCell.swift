//
//  BlogListCell.swift
//  SearchBlog
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import UIKit
import SnapKit
import Kingfisher

final class BlogListCell: UITableViewCell {
    
    let thumbNailImageView = UIImageView()
    let nameLabel = UILabel()
    let titleLabel = UILabel()
    let dateTimeLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configure()
        layout()
    }
    
    private func configure() {
        [thumbNailImageView, nameLabel, titleLabel, dateTimeLabel].forEach {
            contentView.addSubview($0)
        }
        
        thumbNailImageView.contentMode = .scaleAspectFit
        
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.numberOfLines = 2
        
        dateTimeLabel.font = .systemFont(ofSize: 12, weight: .light)
    }
    
    private func layout() {
        nameLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(8)
            $0.trailing.lessThanOrEqualTo(thumbNailImageView.snp.leading).offset(-8)
        }
        
        thumbNailImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.top.trailing.bottom.equalToSuperview().inset(8)
            $0.width.height.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalTo(thumbNailImageView.snp.leading).offset(-8)
        }
        
        dateTimeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalTo(titleLabel)
            $0.bottom.equalTo(thumbNailImageView)
        }
    }
    
    func setData(data: BlogListCellData) {
        thumbNailImageView.kf.setImage(with: data.thumbnailURL, placeholder: UIImage(systemName: "photo"))
        nameLabel.text = data.name
        titleLabel.text = data.title
        
        var dateTime: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy년 MM월 dd일"
            let contentDate = data.dateTime ?? Date()
            return dateFormatter.string(from: contentDate)
        }
        
        dateTimeLabel.text = dateTime
    }
}
