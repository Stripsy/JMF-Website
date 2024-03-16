const Sequelize = require('sequelize');
const db = require('../db');

const UtilisateurRole = db.define('Utilisateur_has_role', {
    role_idrole: {
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


module.exports = UtilisateurRole;