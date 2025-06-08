import UIKit

class DetailViewController: UIViewController {

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isAccessibilityElement = true
        return imageView
    }()

    private let bioLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isAccessibilityElement = true
        return label
    }()

    private let avatarImage: UIImage?
    private let bioText: String

    init(avatarImage: UIImage? = UIImage(systemName: "person.circle.fill"),
         bioText: String = "Jane is a passionate iOS developer with 5 years of experience building user-friendly apps for education and productivity.") {
        self.avatarImage = avatarImage
        self.bioText = bioText
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        view.backgroundColor = .white

        avatarImageView.image = avatarImage
        bioLabel.text = bioText

        view.addSubview(avatarImageView)
        view.addSubview(bioLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),

            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 30),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
