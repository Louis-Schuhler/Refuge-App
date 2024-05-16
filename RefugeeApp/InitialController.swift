import UIKit

class InitialController: UIViewController {
    
    //MARK: Logo Placement
    
    let topImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    //MARK: Buttons
    
    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)//system sytled button
        button.backgroundColor = UIColor(r: 41, g: 199, b: 150)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        
        return button
    }()
    
    let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 41, g: 199, b:150)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
        button.addTarget(self, action: #selector(handleSignUpRegister), for: .touchUpInside)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(topImage)
        view.addSubview(loginRegisterButton)
        view.addSubview(signupButton)
        view.backgroundColor = UIColor.white
        setupImage()
        setupLoginRegisterButton()
        setupSignupButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: Constraints
    
    func setupLoginRegisterButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 265).isActive = true
        loginRegisterButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        loginRegisterButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        loginRegisterButton.layer.cornerRadius = 10
    }
    
    func setupSignupButton() {
        signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signupButton.topAnchor.constraint(equalTo: loginRegisterButton.bottomAnchor, constant: 30 ).isActive = true
        signupButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        signupButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        signupButton.layer.cornerRadius = 10
    }
    

    func setupImage() {

        topImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        topImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        topImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    @objc func handleLoginRegister(){
        self.navigationController?.pushViewController(LoginController(), animated: true)
    }
    
    @objc func handleSignUpRegister(){
        self.navigationController?.pushViewController(RegisterController(), animated: true)
    }
    
}
