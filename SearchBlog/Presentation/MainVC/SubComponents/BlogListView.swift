//
//  BlogListView.swift
//  SearchBlog
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class BlogListView: UITableView {
    
    let disposeBag = DisposeBag()
    let headerView = FilterView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 50)))
    //    let headerView = FilterView(frame: .zero)
    let cellData = PublishSubject<[BlogListCellData]>()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        bind()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        cellData.asDriver(onErrorJustReturn: [])
            .drive(self.rx.items) { tv, row, data in
                let index = IndexPath(row: row, section: 0)
                let cell = tv.dequeueReusableCell(withIdentifier: "BlogListCell", for: index) as! BlogListCell
                cell.setData(data: data)
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    private func configure() {
        self.backgroundColor = .white
        self.register(BlogListCell.self, forCellReuseIdentifier: "BlogListCell")
        self.separatorStyle = .singleLine
        self.rowHeight = 100
        self.tableHeaderView = headerView
    }
}
