'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {

     await queryInterface.createTable('utilisateur', { idutilisateur:{
      type:Sequelize.INTEGER(11),
      allowNull:false,
      primaryKey:true,
      autoIncrement:true
  },
  mail:{
      type:Sequelize.STRING(254),
      allowNull:false,
      unique:true
  },
  mdp:{
      type:Sequelize.STRING(256),
      allowNull:false,
  },
  nom:{
      type:Sequelize.STRING(50),
      allowNull:false,

  },
  prenom:{
      type:Sequelize.STRING(50),
      allowNull:false,

  },
  telephone:{
      type:Sequelize.STRING(15),
      allowNull:false,

  } });

  await queryInterface.createTable('groupe', { idgroupe:{
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

} });

      await queryInterface.createTable('evenement', { idevenement:{
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
    type:Sequelize.INTEGER,
  } }).then(function() {
      queryInterface.createTable('utilisateur_has_evenement', {
        evenement_idevenement: {
          type: Sequelize.INTEGER,
          references: { model: 'evenement', key: 'idevenement' },
          primaryKey: true,
          onDelete: 'cascade'
        },
        utilisateur_idutilisateur: {
          type: Sequelize.INTEGER,
          references: { model: 'utilisateur', key: 'idutilisateur' },
          primaryKey: true,
          onDelete: 'cascade'
        }
      })
    });

    await queryInterface.addConstraint('evenement',
       {
        fields:['groupe_idgroupe'],
        type: 'foreign key',
        references:{
          table:'groupe',
          field:'idgroupe'
        },
        onDelete: 'cascade'
      });

      

      
      
      await queryInterface.createTable('role', { idrole:{
        type:Sequelize.INTEGER(11),
        allowNull:false,
        primaryKey:true,
        autoIncrement:true
    },
    nomrole:{
        type:Sequelize.STRING(15),
        allowNull:false,
    } }).then(function() {
      queryInterface.createTable('utilisateur_has_role', {
        role_idrole: {
          type: Sequelize.INTEGER,
          references: { model: 'role', key: 'idrole' },
          primaryKey: true,
        },
        utilisateur_idutilisateur: {
          type: Sequelize.INTEGER,
          references: { model: 'utilisateur', key: 'idutilisateur' },
          primaryKey: true,
          unique:true,
          onDelete: 'cascade'
        }
      })
    });

      
    await queryInterface.addIndex('utilisateur_has_role', ['utilisateur_idutilisateur']);
    await queryInterface.addIndex('utilisateur_has_role', ['role_idrole']);

    await queryInterface.addIndex('utilisateur_has_evenement', ['utilisateur_idutilisateur']);
    await queryInterface.addIndex('utilisateur_has_evenement', ['evenement_idevenement']);
    
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add reverting commands here.
     *
     * Example:
     * await queryInterface.dropTable('users');
     */
  }
};
