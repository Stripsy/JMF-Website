const Utilisateur = require('../models/Utilisateur');
const bcrypt = require('bcrypt');
const saltRounds = 10

const inscription = async (req, res) => {

    const { email, password, nom, prenom, telephone } = await req.body;

    const bcryptpassword = await bcrypt.hash(password, saltRounds);
    try {
        await Utilisateur.create({

            mail: email, mdp: bcryptpassword, nom: nom, prenom: prenom, telephone: telephone

        })

        req.flash('inscription', "Votre inscription a bien été prise en compte !");

        await res.redirect('connexion');
    }
    catch (error) {
        req.flash('inscriptionfail', "L'adresse email est déjà utilisée !");
        await res.redirect('inscription');
    }

}

module.exports = {
    inscription
}