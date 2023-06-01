//
//  MainVC.swift
//  SearchBlog
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainVC: UIViewController {
    let disposeBag = DisposeBag()
    
    let searchBar = SearchBar()
    let listView = BlogListView()
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//
//        bind()
//        configure()
//        layout()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    override func viewDidLoad() {
        bind()
        configure()
        layout()
    }
    
    
    private func bind() {
        
    }
    
    private func configure() {
        navigationItem.title = "다음 블로그 검색"
        view.backgroundColor = .white
    }
    
    private func layout() {
        [searchBar, listView].forEach {
            view.addSubview($0)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
//            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        listView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
