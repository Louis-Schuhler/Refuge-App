import UIKit

class VerifyController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        view.addSubview(verifyButton)
        view.addSubview(postponeButton)
        view.addSubview(thanksMessage)
        view.addSubview(profileImageView)
        view.addSubview(doneMessage)
        
        setupVerifyButton()
        setupPostponeButton()
        setupThanksMessage()
        setupProfileImageView()
        setupDoneMessage()
    }
    
    
    
    let verifyButton: UIButton = {
        let button = UIButton(type: .system)//system sytled button
        button.backgroundColor = UIColor(r: 41, g: 199, b: 150)
        button.setTitle("Verify Now by Helper", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(handleFindHelper), for: .touchUpInside)
        return button
    }()
    
    let postponeButton: UIButton = {
        let button = UIButton(type: .system)//system sytled button
        button.backgroundColor = UIColor.gray
        button.setTitle("Postpone", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 10

//        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()
    
    let thanksMessage: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 40))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Thank You"
        label.numberOfLines = 0;
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor(r: 41, g: 199, b: 150)
        label.textAlignment = .center

        return label
    }()
    
    let doneMessage: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 40))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please verify your Information"
        label.numberOfLines = 0;
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        label.font = UIFont .boldSystemFont(ofSize: 15)
        label.textColor = UIColor(r: 41, g: 199, b: 150)
        label.textAlignment = .center
        

        return label
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        //imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImaveView)))
        
        return imageView
    }()

    func setupProfileImageView(){
        // need x, y, width, height constraints
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    func setupThanksMessage(){
        // need x, y, width, height constraints
        //thanksMessage.translatesAutoresizingMaskIntoConstraints = false
        thanksMessage.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 50).isActive = true
        thanksMessage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        thanksMessage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        thanksMessage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }
    
    func setupDoneMessage(){
        // need x, y, width, height constraints
        //doneMessage.translatesAutoresizingMaskIntoConstraints = false
        doneMessage.topAnchor.constraint(equalTo: thanksMessage.bottomAnchor, constant: 5).isActive = true
        doneMessage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        doneMessage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        doneMessage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        }

    
    func setupVerifyButton(){
        // need x, y, width, height constraints
        verifyButton.topAnchor.constraint(equalTo: doneMessage.bottomAnchor, constant: 60).isActive = true
        verifyButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        verifyButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        verifyButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }
    
    func setupPostponeButton(){
        // need x, y, width, height constraints
        postponeButton.topAnchor.constraint(equalTo: verifyButton.bottomAnchor, constant: 30).isActive = true
        postponeButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        postponeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        postponeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }

    @objc func handleFindHelper(){
        
        self.navigationController?.pushViewController(FindHelperController(), animated: true)
    }

}
