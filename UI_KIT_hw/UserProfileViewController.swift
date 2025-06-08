import UIKit

class UserProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Profile"

        let nameLabel = UILabel()
        nameLabel.text = "Akhmed Kudaibergen"
        nameLabel.font = .boldSystemFont(ofSize: 24)
        nameLabel.textAlignment = .center

        let avatar = UIImageView(image: UIImage(systemName: "person.circle"))
        avatar.tintColor = .systemBlue
        avatar.contentMode = .scaleAspectFit
        avatar.translatesAutoresizingMaskIntoConstraints = false

        let infoLabel = UILabel()
        infoLabel.text = "25 • ALMATY • 3.0k followers"
        infoLabel.textAlignment = .center
        infoLabel.textColor = .darkGray
        infoLabel.font = .systemFont(ofSize: 16)

        let button = UIButton(type: .system)
        button.setTitle("View Details", for: .normal)
        button.addTarget(self, action: #selector(openDetails), for: .touchUpInside)

        let stack = UIStackView(arrangedSubviews: [nameLabel, avatar, infoLabel, button])
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 100),
            avatar.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    @objc private func openDetails() {
        let detailVC = DetailViewController(
            avatarImage: UIImage(systemName: "person.circle.fill"),
            bioText: "Akhmed is a tech enthusiast focused on building educational apps and empowering communities through technology."
        )
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

import SwiftUI

#Preview {
    UINavigationController(rootViewController: UserProfileViewController())
}
