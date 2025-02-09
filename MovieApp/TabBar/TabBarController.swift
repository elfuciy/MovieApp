//
//  TabBar.swift
//  MovieApp
//
//  Created by Elsever on 01.02.25.
//

import UIKit

class TabBar: UITabBarController, UITabBarControllerDelegate {

    let tabbarView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    private func configure() {
        self.delegate = self
        tabBar.backgroundColor = .systemGray6
        createTab()
//        setView()
    }
  
    private func createTab() {
        let tabOne = HomeController()
        let tabOneBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        tabOne.tabBarItem = tabOneBarItem
    
        let tabTwo = SearchController()
        let tabTwoBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magn"), selectedImage: UIImage(systemName: "magnifyingglass.fill"))
        tabTwo.tabBarItem = tabTwoBarItem
        
        let tabThree = ActorController()
        let tabThreeBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magn"), selectedImage: UIImage(systemName: "magnifyingglass.fill"))
        tabThree.tabBarItem = tabThreeBarItem
        
        self.viewControllers = [tabOne, tabTwo, tabThree]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
    
    private func setView() {
         view.addSubview(tabbarView)
         tabbarView.backgroundColor = .quaternarySystemFill
         tabbarView.translatesAutoresizingMaskIntoConstraints = false
         tabbarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
         tabbarView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60).isActive = true
         tabbarView.heightAnchor.constraint(equalToConstant: 60).isActive = true
         tabbarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         tabbarView.layer.cornerRadius = 30
     }
}
