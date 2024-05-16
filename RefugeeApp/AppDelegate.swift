import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var userGlobal: User!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        // Barre de navigation
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor(r: 41, g: 199, b: 150)

        /* Pour la plupart, la fenêtre de votre application ne change jamais. Après la création de la fenêtre, elle reste la même et seuls les vues affichées par celle-ci changent.
         Chaque application possède au moins une fenêtre qui affiche l'interface utilisateur de l'application sur l'écran principal du périphérique.
         Si un écran externe est connecté au périphérique, les applications peuvent créer une deuxième fenêtre pour présenter du contenu sur cet écran également. */
        
        // Remplacement du storyboard par sa propre fenêtre manuellement
        /* La propriété d'écran de la classe UIWindow représente l'affichage spécifique du périphérique sur lequel la fenêtre est actuellement affichée.
         Cette propriété contient un objet d'écran, c'est-à-dire une instance de UIScreen, qui contient des informations sur l'affichage du périphérique, telles que ses limites, son mode et sa luminosité. */
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Rendre cette fenêtre visible
        window?.makeKeyAndVisible()
        
        // Vue racine
        window?.rootViewController = UINavigationController(rootViewController: LoginController())
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Appelé lorsque l'application est sur le point de passer de l'état actif à l'état inactif. Cela peut se produire pour certains types d'interruptions temporaires (comme un appel téléphonique entrant ou un message SMS) ou lorsque l'utilisateur quitte l'application et qu'elle commence la transition vers l'état de fond.
        // Utilisez cette méthode pour mettre en pause les tâches en cours, désactiver les minuteries et invalider les rappels de rendu graphique. Les jeux doivent utiliser cette méthode pour mettre en pause le jeu.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Utilisez cette méthode pour libérer les ressources partagées, enregistrer les données utilisateur, invalider les minuteries et stocker suffisamment d'informations sur l'état de l'application pour restaurer votre application dans son état actuel au cas où elle serait terminée ultérieurement.
        // Si votre application prend en charge l'exécution en arrière-plan, cette méthode est appelée à la place de applicationWillTerminate: lorsque l'utilisateur quitte.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Appelé dans le cadre de la transition de l'arrière-plan à l'état actif ; ici, vous pouvez annuler bon nombre des modifications apportées lors de l'entrée en arrière-plan.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Redémarrez les tâches qui étaient en pause (ou pas encore démarrées) pendant que l'application était inactive. Si l'application était précédemment en arrière-plan, actualisez éventuellement l'interface utilisateur.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Appelé lorsque l'application est sur le point de se terminer. Enregistrez les données si nécessaire. Voir également applicationWillEnterForeground:.
    }
}
