import UIKit

class FindHelperController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        view.addSubview(findHelperMessage)
        view.addSubview(searchButton)
        view.addSubview(helperFoundMessage)
        view.addSubview(getVerifiedButton)
        view.addSubview(imageConnect)
        view.addSubview(imageHelper)
        view.addSubview(border)
        
        setupFindHelperMessage()
        setupSearchButton()
        setupHelperFoundMessage()
        setupGetVerifiedButton()
        setupImageConnect()
        setupImageHelper()
        setupBorder()
    }

    let findHelperMessage: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 40))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To find your helper..."
        label.numberOfLines = 0;
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        label.font = UIFont .boldSystemFont(ofSize: 20)
        label.textColor = UIColor(r: 41, g: 199, b: 150)
        label.textAlignment = .center
        
        return label;
    }()
    
    let searchButton: UIButton = {
        let button = UIButton(type: .system)//system sytled button
        button.backgroundColor = UIColor(r: 41, g: 199, b: 150)
        button.setTitle("Search On Maps", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(handleMaps), for: .touchUpInside)
        return button
    }()
    
    let border: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 40))
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "Thank You"
        label.numberOfLines = 0;
        label.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        label.font = UIFont.boldSystemFont(ofSize: 30)
        //label.textColor = UIColor(r: 41, g: 199, b: 150)
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        
        return label
    }()
    
    let helperFoundMessage: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 40))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Found a Helper?"
        label.numberOfLines = 0;
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        label.font = UIFont .boldSystemFont(ofSize: 20)
        label.textColor = UIColor(r: 41, g: 199, b: 150)
        label.textAlignment = .center
        
        return label;
    }()
    
    let getVerifiedButton: UIButton = {
        let button = UIButton(type: .system)//system sytled button
        button.backgroundColor = UIColor(r: 41, g: 199, b: 150)
        button.setTitle("Get Verified", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(handleVerify), for: .touchUpInside)
        return button
    }()
    
    lazy var imageConnect: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Connect")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        //imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImaveView)))
        
        return imageView
    }()
    
    lazy var imageHelper: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Helper")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        //imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImaveView)))
        
        return imageView
    }()
    
    func setupFindHelperMessage(){
        // need x, y, width, height constraints
        //registerMessage.translatesAutoresizingMaskIntoConstraints = false
        findHelperMessage.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        findHelperMessage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        findHelperMessage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        findHelperMessage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }
    
    func setupImageConnect(){
        // need x, y, width, height constraints
        imageConnect.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageConnect.bottomAnchor.constraint(equalTo: findHelperMessage.bottomAnchor, constant: 150).isActive = true
        imageConnect.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageConnect.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    func setupSearchButton(){
        // need x, y, width, height constraints
        searchButton.topAnchor.constraint(equalTo: imageConnect.bottomAnchor, constant: 20).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        searchButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        searchButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }
    
    func setupBorder(){
        // need x, y, width, height constraints
        //thanksMessage.translatesAutoresizingMaskIntoConstraints = false
        border.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 25).isActive = true
        border.heightAnchor.constraint(equalToConstant: 1).isActive = true
        border.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        border.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
    }

    func setupHelperFoundMessage(){
        // need x, y, width, height constraints
        //registerMessage.translatesAutoresizingMaskIntoConstraints = false
        helperFoundMessage.topAnchor.constraint(equalTo: border.bottomAnchor, constant: 20).isActive = true
        helperFoundMessage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        helperFoundMessage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        helperFoundMessage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }
    
    func setupImageHelper(){
        // need x, y, width, height constraints
        imageHelper.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageHelper.bottomAnchor.constraint(equalTo: helperFoundMessage.bottomAnchor, constant: 155).isActive = true
        imageHelper.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageHelper.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    func setupGetVerifiedButton(){
        // need x, y, width, height constraints
        getVerifiedButton.topAnchor.constraint(equalTo: imageHelper.bottomAnchor, constant: 20).isActive = true
        getVerifiedButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        getVerifiedButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        getVerifiedButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }
    
    @objc func handleVerify(){
        self.navigationController?.pushViewController(VictoryController(), animated: true)
    }
    
    @objc func handleMaps(){
        self.navigationController?.pushViewController(MapController(), animated: true)
    }

}
