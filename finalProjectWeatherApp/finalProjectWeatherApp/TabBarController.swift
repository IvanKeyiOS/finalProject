//
//  TabBarController.swift
//  finalProjectWeatherApp
//
//  Created by Иван Курганский on 02/03/2025.
//

import SnapKit
import UIKit

final class TabBarController: UITabBarController {
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.tintColor = .white
        setupViewController()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.selectedIndex = 1
    }

    //MARK: - Private methods
    private func setupViewController() {
        viewControllers = [setupNavigationController(rootViewController: MapScreenViewController(),
                                                     image: UIImage(systemName: "map") ?? UIImage.add),
                           setupNavigationController(rootViewController: MainScreenViewController(),
                                                     image: UIImage(systemName: "location.fill") ?? UIImage.add),
                           setupNavigationController(rootViewController: SecondScreenViewController(),
                                                     image: UIImage(systemName: "list.bullet") ?? UIImage.add)]
    }

    private func setupNavigationController(rootViewController: UIViewController,
                                           image: UIImage) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.image = image
        return navigationController
    }
    
    private func setupTapBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        tabBar.scrollEdgeAppearance = appearance
        
        tabBar.setNeedsLayout()
        tabBar.layoutIfNeeded()
        
        appearance.stackedLayoutAppearance.normal.iconColor = .green
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.orange]

        // Применение стиля
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}
