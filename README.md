# GoBus - Application de Réservation de Tickets de Bus

GoBus est une application mobile développée en Flutter permettant aux utilisateurs de réserver des tickets de bus en ligne. L'application est composée d'un frontend en Flutter et d'un backend en Node.js, utilisant Express.js pour la gestion des API et MongoDB pour la base de données. Firebase est utilisé pour l'authentification via Google et l'envoi de notifications.

Ce projet est développé en équipe et vise à simplifier la réservation de tickets de bus, tout en offrant une interface utilisateur fluide et réactive.

## Technologies utilisées

### Frontend
- **Flutter** : Framework de développement mobile multiplateforme utilisé pour créer l'application.
- **Dart** : Langage de programmation utilisé pour développer l'application Flutter.
- **Firebase** : Utilisé pour l'authentification des utilisateurs via Google et l'envoi de notifications push.
- **Provider** : Gestion d'état dans l'application Flutter.

### Backend
- **Node.js** : Environnement d'exécution JavaScript pour le backend.
- **Express.js** : Framework web minimaliste pour créer des API RESTful.
- **MongoDB** : Base de données NoSQL utilisée pour stocker les informations sur les utilisateurs, les réservations, les trajets, etc.
- **Firebase Admin SDK** : Utilisé pour gérer l'envoi de notifications push aux utilisateurs via Firebase Cloud Messaging (FCM).
- **JWT** : Gestion de l'authentification pour sécuriser les routes de l'API.

## Prérequis

- **Node.js** (version 14.x ou supérieure)
- **MongoDB** installé localement ou un cluster MongoDB Atlas
- **Flutter** (version 3.x ou supérieure)
- **Firebase** (création d'un projet Firebase)

## Installation du backend

1. Clonez ce dépôt sur votre machine locale :
   ```bash
   git clone https://github.com/KOUDJENOUME/Project-gobus.git
   cd Project-gobus/backend
   ```
   
2. Installez les dépendances du backend :
   ```bash
   npm install
   ```

3. Configurez Firebase dans le backend :
   
   - Allez sur la console Firebase et créez un projet
   - Activez Firebase Cloud Messaging (FCM) et obtenez la clé de service pour l'authentification et l'envoi de notifications.
   - Placez la clé privée Firebase dans le dossier backend/config/(nommée firebase-service-account.json).
     
4. Configurer MongoDB :
   
   - Utilisez MongoDB localement ou créez un cluster MongoDB Atlas.
   - Ajoutez la chaîne de connexion MongoDB dans le fichier .envdu backend.
     
5. Démarrez le serveur backend :
   ```bash
   nodemon index
   ```
   Le backend sera disponible http://localhost:3000 par défaut.
          
## Installation du frontend

1. Clonez ce dépôt et recevez au dossier Flutter :

```bash
git clone https://github.com/KOUDJENOUME/Project-gobus.git
cd Project-gobus/GobusProject
```

2. Assurez-vous que Flutter est installé et configurez votre environnement :

```bash
flutter doctor
```

3. Installez les dépendances Flutter :

```bash
flutter pub get
```

4. Configurez Firebase dans l'application Flutter :
 
   - Allez sur la console Firebase , créez un projet et ajoutez votre application Flutter.
   - Téléchargez les fichiers google-services.jsonpour Android et GoogleService-Info.plistpour iOS, puis placez-les respectivement dans les dossiers android/app/et ios/Runner/.

5. Démarrez l'application Flutter :

```bash
flutter run
```
## Licences

Ce projet est sous licence MIT - voir le fichier 'LICENSE' pour plus de détails.

   
