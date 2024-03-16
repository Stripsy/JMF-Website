const UtilisateurEvenement = require("../models/UtilisateurEvenement")

const addparticipant = async (req, res) => {

    const { id } = req.params;

    try{
    await UtilisateurEvenement.create({
        evenement_idevenement: id, utilisateur_idutilisateur: req.session.idu
    })

    req.flash('addparticipant', "Votre participation a été prise en compte !");
    await res.redirect('/spectacles')
}
    catch(err){
        req.flash('failparticipant', "Vous êtes déjà inscrit à cet événement !");
        res.redirect('/spectacles')
    };

}

const deleteparticipant = async (req, res) => {

    const { id } = req.params;

    await UtilisateurEvenement.destroy({
        where: {
            evenement_idevenement: id,
        },
        raw: true,
    })

    req.flash('deleteparticipant', "Ce participant a bien été supprimé !");
    await res.redirect('/admin/evenements/participants/'+id)
}

module.exports = {
    addparticipant, deleteparticipant
}