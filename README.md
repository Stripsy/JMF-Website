
# Site Web JMF


Ce projet est un site web pour l'association départementale Le Mans Sarthe des JM France (Jeunesses Musicales de France). Il permet aux écoles et aux citoyens de s'inscrire aux événements musicaux organisés par l'association.
## Fonctionnalités

- Inscription et connexion des utilisateurs
- Gestion des utilisateurs (rôles admin, école, citoyen)
- Affichage des événements musicaux
- Inscription aux événements
- Calendrier des événements
- Présentation des groupes musicaux
- Formulaire de contact
- Panneau d'administration pour gérer les utilisateurs, les événements et les groupes
## Technologies utilisées

- **Node.js**

- **Express.js**

- **MySQL**

- **Sequelize**

- **Handlebars**

- **Bootstrap**

## Installation

Clonez le dépôt Git sur votre machine locale.

```bash
git clone https://github.com/Stripsy/JMF-Website.git
```

Installez les dépendances
```bash
npm install
```

Configurez les paramètres de connexion à la base de données MySQL dans le fichier de configuration approprié.

Exécutez les migrations de base de données
```bash
npx sequelize-cli db:migrate
```

Démarrez le serveur
```bash
npm start
```
## Screenshots

![App Screenshot](https://i.imgur.com/Bf9Ug7K.png)

![App Screenshot](https://i.imgur.com/d0nuCmY.png)

![App Screenshot](https://i.imgur.com/GCwocHB.png)

![App Screenshot](https://i.imgur.com/wyGur7L.png)

![App Screenshot](https://i.imgur.com/PuLILca.png)