import UIKit

class HomeController: UIViewController {
    
    //MARK: Image
    
    var isEmployee:Bool!
    var isVerified:Bool!
    
    let topImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //MARK: Buttons
    
    let registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 41, g: 199, b: 150)
        button.setTitle("Update Information", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
        button.addTarget(self, action: #selector(updateAction), for: .touchUpInside)

        return button
        
    }()
    
    let updateButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 41, g:199, b:150)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
        button.addTarget(self, action: #selector(registerAction), for: .touchUpInside)

        return button
    }()
    
    let findHelperButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 41, g:199, b:150)
        button.setTitle("Find Helper Near Me", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
        button.addTarget(self, action: #selector(findHelpAction), for: .touchUpInside)

        
        return button
    }()
    

    @objc func updateAction(){
        let register = RegisterController()
        if (isEmployee && isVerified){
            self.navigationController?.pushViewController(WorkerVerfication(), animated: true)
        } else {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            register.user = appDelegate.userGlobal
            self.navigationController?.pushViewController(register, animated: true)
        }
    }
    
    @objc func registerAction(){
        let register = RegisterController()
        if (isEmployee && isVerified){
            register.isEmployee = true
        }
        self.navigationController?.pushViewController(register, animated: true)
    }
    
    @objc func findHelpAction(){
        let verify = VerifyController()
        self.navigationController?.pushViewController(verify, animated: true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(topImage)
        view.addSubview(registrationButton)
        setupRegistrationButton()
        setupImage()
        
        if (isEmployee && isVerified){
            view.addSubview(updateButton)
            setupUpdateButton()
            
        } else {
            view.addSubview(findHelperButton)
            setupHelperButton()
        }
    }

    
    
    
    //MARK: Hide Navigation Bar
    
    override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: Constraints
    
    func setupImage() {
        
        topImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        topImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        topImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupRegistrationButton() {
        registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registrationButton.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 265).isActive = true
        registrationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        registrationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        registrationButton.layer.cornerRadius = 10
    }
    
    func setupUpdateButton() {
        updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        updateButton.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 30).isActive = true
        updateButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        updateButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        updateButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        updateButton.layer.cornerRadius = 10
    }
    
    func setupHelperButton() {
        findHelperButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        findHelperButton.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 30).isActive = true
        findHelperButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        findHelperButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        findHelperButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        findHelperButton.layer.cornerRadius = 10
    }

    
    
}
