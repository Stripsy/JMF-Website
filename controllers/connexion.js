const Utilisateur = require('../models/Utilisateur');
const Role = require('../models/Role');
const bcrypt = require('bcrypt');

const deconnexion = async (req, res) => {
    if (req.session.mail) {
        req.session.destroy();
    }
    await res.redirect('/');
}


const connexion = async (req, res) => {

    // Récupération de la saisie utilisateur
    const { email, password } = await req.body;
    // Requête SQL avec jointure avec la table Rôle pour récupérer l'adresse email saisie
    const user = await Utilisateur.findOne({
        include:[Role],
        raw: true,
        where: {
            mail: email,
        },
        nest:true
    })
    // Vérification de l'existence de l'utilisateur
    if (!user) {
        req.flash('info', 'Email ou mot de passe incorrect !');
        res.redirect('/connexion');
    }
    // Comparaison du mot de passe saisi avec le mot de passe haché
    else {
        bcrypt.compare(password, user.mdp, (err, same) => {
            if (!same) {
                req.flash('info', 'Email ou mot de passe incorrect !');
                res.redirect('/connexion');
            }
    // Ouverture de session pour l'utilisateur
            else {

                req.session.nom = user.nom;
                req.session.mail = email;
                req.session.idu = user.idutilisateur;
                req.session.role = user.Roles.nomrole;
                req.session.save();
                res.redirect('/spectacles');

            }
        })
    }

}

module.exports = {
    connexion, deconnexion
}