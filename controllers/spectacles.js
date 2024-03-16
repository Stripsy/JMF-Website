const Evenement = require('../models/Evenement');
const Groupe = require('../models/Groupe');
const { Op } = require("sequelize");

const allspectacles = async (req, res) => {

    const spectacles = await Groupe.findAll({
        raw: true
    })

    await res.render('spectacles', { spectacles })

}

const spectaclesavenir = async (req, res) => {

    const avenir = await Evenement.findAll({
        include: Groupe,
        attributes: ['nom', 'dateevenement', 'groupe.idgroupe', 'groupe.titre', 'groupe.image', 'groupe.texte', 'groupe.duree', 'groupe.type'],
        where: { dateevenement: { [Op.gt]: new Date(), } },
        raw: true,

    })

    await res.render('home', { avenir })
}


const spectacle = async (req, res) => {

    const { id } = req.params;

    const spec = await Groupe.findOne({
        raw: true,
        where: {
            idgroupe: id
        }
    })

    const even = await Evenement.findOne({
        include: Groupe,
        attributes: ['nom', 'dateevenement', 'idevenement', 'resume', 'groupe.idgroupe', 'groupe.titre', 'groupe.image', 'groupe.texte', 'groupe.duree', 'groupe.type'],
        where: { dateevenement: { [Op.gt]: new Date(), }, groupe_idgroupe: id },
        raw: true,
        nest: true,

    })

    await res.render('groupe', { spec, even })
}

module.exports = {
    allspectacles, spectaclesavenir, spectacle
}