const Sequelize = require('sequelize');
const db = require('../db');

const Groupe = db.define('Groupe', {
    idgroupe:{
        type:Sequelize.INTEGER(11),
        allowNull:false,
        primaryKey:true,
        autoIncrement:true
    },
    titre:{
        type:Sequelize.STRING(100),
        allowNull:false,
    },
    image:{
        type:Sequelize.STRING(512),
        allowNull:false,
    },
    texte:{
        type:Sequelize.STRING(800),
        allowNull:false,

    },
    duree:{
        type:Sequelize.STRING(10),
        allowNull:false,

    },
    type:{
        type:Sequelize.STRING(15),
        allowNull:false,

    },
});

module.exports = Groupe;