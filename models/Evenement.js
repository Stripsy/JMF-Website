const Sequelize = require('sequelize');
const db = require('../db');
const Groupe = require('./Groupe');
const Utilisateur = require('./Utilisateur');

const Evenement = db.define('Evenement', {
    idevenement:{
        type:Sequelize.INTEGER(11),
        allowNull:false,
        primaryKey:true,
        autoIncrement:true
    },
    nom:{
        type:Sequelize.STRING(45),
        allowNull:false,
    },
    dateevenement:{
        type:Sequelize.DATE,
        allowNull:false,
    },
    adresse:{
        type:Sequelize.STRING(100),
        allowNull:true,

    },
    ville:{
        type:Sequelize.STRING(50),
        allowNull:true,

    },
    cp:{
        type:Sequelize.STRING(5),
        allowNull:true,

    },
    resume:{
        type:Sequelize.STRING(300),
        allowNull:true,

    },
    groupe_idgroupe:{
        type:Sequelize.INTEGER
    }
});

Utilisateur.belongsToMany(Evenement, { through: 'utilisateur_has_evenement', foreignKey: 'utilisateur_idutilisateur' });
Evenement.belongsToMany(Utilisateur, { through: 'utilisateur_has_evenement', foreignKey: 'evenement_idevenement'  });

Groupe.hasMany(Evenement, { foreignKey: 'groupe_idgroupe' })
Evenement.belongsTo(Groupe, { foreignKey: 'groupe_idgroupe' })

module.exports = Evenement;