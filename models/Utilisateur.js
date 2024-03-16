const Sequelize = require('sequelize');
const db = require('../db');
const UtilisateurRole = require('./UtilisateurRole');

const Utilisateur = db.define('Utilisateur', {
    idutilisateur: {
        type: Sequelize.INTEGER(11),
        allowNull: false,
        primaryKey: true,
        autoIncrement: true
    },
    mail: {
        type: Sequelize.STRING(254),
        allowNull: false,
        unique: true
    },
    mdp: {
        type: Sequelize.STRING(256),
        allowNull: false,
    },
    nom: {
        type: Sequelize.STRING(50),
        allowNull: false,

    },
    prenom: {
        type: Sequelize.STRING(50),
        allowNull: false,

    },
    telephone: {
        type: Sequelize.STRING(10),
        allowNull: false,

    },

}, {
    hooks: {
        afterCreate: function () {

            Utilisateur.findOne({
                order: [['idutilisateur', 'DESC']],
            }).then((res) => {
                UtilisateurRole.create({
                
                    role_idrole: 4, utilisateur_idutilisateur: res.idutilisateur
                }
                )
            });
           

        }
    }
});

module.exports = Utilisateur;