//
//  NewsDetalisViewController.swift
//  WSP.KBTU
//
//  Created by Lidiya Karnaukhova on 25.05.2022.
//

import UIKit

class NewsDetalisViewController: UIViewController {
   
    var newsTitle: String? = nil
    var newsDate: String? = nil
    var newsDescription: String? = nil
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    lazy var newsCellTitle: UILabel = {
        let newsCellTitle = UILabel()
        newsCellTitle.text = newsTitle
        newsCellTitle.isUserInteractionEnabled = true
        newsCellTitle.textColor = .black
        newsCellTitle.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        newsCellTitle.numberOfLines = 0
        return newsCellTitle
    }()
    
    lazy var newsCellDate: UILabel = {
        let newsCellDate = UILabel()
        newsCellDate.text = newsDate
        newsCellDate.isUserInteractionEnabled = true
        newsCellDate.textColor = .systemBlue
        newsCellDate.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        newsCellDate.numberOfLines = 0
        return newsCellDate
    }()
    
    lazy var newsCellDescription: UILabel = {
        let newsCellDescription = UILabel()
        newsCellDescription.text = newsDescription
        newsCellDescription.isUserInteractionEnabled = true
        newsCellDescription.textColor = .darkGray
        newsCellDescription.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        newsCellDescription.numberOfLines = 0
        return newsCellDescription
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
        configureNavigationBar()
        configureNewsCellTitle()
        configureNewsCellDate()
        configureNewsCellDescription()
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.alwaysBounceVertical = true
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(additionalSafeAreaInsets)
            $0.height.greaterThanOrEqualToSuperview()
        }
        
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.lessThanOrEqualToSuperview()
            $0.height.greaterThanOrEqualToSuperview()
            
        }

    }
    
    private func configureNavigationBar() {
        let leftNavigationItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backToNewsPage))
        leftNavigationItem.tintColor = .systemGray
        navigationItem.leftBarButtonItem = leftNavigationItem
        navigationItem.title = NSLocalizedString("News Details", comment: "")
    }

    private func configureNewsCellTitle() {
        containerView.addSubview(newsCellTitle)
        newsCellTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
    }

    private func configureNewsCellDate() {
        containerView.addSubview(newsCellDate)
        newsCellDate.snp.makeConstraints {
            $0.top.equalTo(newsCellTitle.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
        }
    }
    
    private func configureNewsCellDescription() {
        containerView.addSubview(newsCellDescription)
        newsCellDescription.snp.makeConstraints {
            $0.top.equalTo(newsCellDate.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
    }

    @objc private func backToNewsPage() {
        dismiss(animated: true)
    }

}
