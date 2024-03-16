const Sequelize = require('sequelize');
const db = require('../db');

const UtilisateurEvenement = db.define('Utilisateur_has_evenement', {
    evenement_idevenement: {
        type: Sequelize.INTEGER(11),
        allowNull: false,
        primaryKey: true,
    },
    utilisateur_idutilisateur: {
        type: Sequelize.INTEGER(11),
        allowNull: false,
        primaryKey: true,
    },


});


module.exports = UtilisateurEvenement;