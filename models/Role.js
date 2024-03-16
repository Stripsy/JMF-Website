const Sequelize = require('sequelize');
const db = require('../db');
const Utilisateur = require('./Utilisateur');

const Role = db.define('Role', {
    idrole:{
        type:Sequelize.INTEGER(11),
        allowNull:false,
        primaryKey:true,
        autoIncrement:true
    },
    nomrole:{
        type:Sequelize.STRING(15),
        allowNull:false,
    },


});

Utilisateur.belongsToMany(Role, { through: 'utilisateur_has_role', foreignKey: 'utilisateur_idutilisateur' });
Role.belongsToMany(Utilisateur, { through: 'utilisateur_has_role', foreignKey: 'role_idrole'  });


module.exports = Role;