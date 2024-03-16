const Groupe = require('../models/Groupe');


const allGroupes = async (req, res) => {

    const groupes = await Groupe.findAll({
        raw: true
    })

    await res.render('admin/groupes', { groupes, layout: 'adminmain' })
}

const addViewg = async (req, res) => {

    const groupe = await Groupe.findAll({
        raw: true
    })

    await res.render('admin/addgroupe', { groupe, layout: 'adminmain' })
}

const addGroupe = async (req, res) => {

    const { nom, lien, texte, duree, type } = await req.body;

    await Groupe.create({
        titre: nom, image: lien, texte: texte, duree: duree, type: type
    })

    req.flash('addgroupe', "Le groupe a bien été ajouté !");

    await res.redirect('/admin/groupes');
}

const editGroupe = async (req, res) => {

    const { id } = await req.params;

    const groupe = await Groupe.findOne({
        where: {
            idgroupe: id
        },
        raw: true
    })

    await res.render('admin/editgroupe', { groupe, layout: 'adminmain' })

}

const updateGroupe = async (req, res) => {

    const { id } = req.params;

    const data = req.body;

    const selector = { where: { idgroupe: id } }

    await Groupe.update(data, selector)

    req.flash('editgroupe', "Le groupe a bien été modifié !");

    await res.redirect('../')
}

const deleteGroupe = async (req, res) => {

    const { id } = req.params;

    const selector = { where: { idgroupe: id } }

    await Groupe.destroy(selector)

    req.flash('deletegroupe', "Le groupe a bien été supprimé !");

    await res.redirect('../')
}

module.exports = {
    allGroupes, addViewg, addGroupe, editGroupe, updateGroupe, deleteGroupe
}    