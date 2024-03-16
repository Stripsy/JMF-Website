const Role = require('../models/Role');
const Utilisateur = require('../models/Utilisateur');
const UtilisateurRole = require('../models/UtilisateurRole');
const { Op } = require("sequelize");


const allUsers = async (req, res) => {

    const user = await Utilisateur.findAll({
        include:{
            model:Role,
                where:{
                    nomrole:{
                        [Op.notLike]: 'admin'
                    }
                }
            }
         ,
        raw: true,
        nest: true,

    })

    await res.render('admin/utilisateurs', { user, layout: 'adminmain' })
}

const editUser = async (req, res) => {

    const { id } = await req.params;

    const user = await Utilisateur.findOne({
        where: {
            idutilisateur: id
        },
        raw: true
    })

    const role = await Role.findAll({
        raw: true,
    })

    await res.render('admin/edituser', { user, role, layout: 'adminmain' })
}

const updateUser = async (req, res) => {

    const { id } = req.params;

    const data = req.body;

    const selector = { where: { idutilisateur: id } }

    const data2 = {role_idrole:data.role};

    const selector2 = {where: {utilisateur_idutilisateur: data.id}};
    options = { multi: true };

    await UtilisateurRole.update(data2, selector2)

    await Utilisateur.update(data, selector)

    req.flash('updateuser', "L'utilisateur a bien été modifié !");

    await res.redirect('../')
}

const deleteUser = async (req, res) => {

    const { id } = req.params;

    const selector = { where: { idutilisateur: id } }

    await Utilisateur.destroy(selector)

    req.flash('deleteuser', "L'utilisateur a bien été supprimé !");

    await res.redirect('../')
}



module.exports = {
    allUsers, editUser, updateUser, deleteUser
}