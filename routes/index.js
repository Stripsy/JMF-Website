const express = require('express');
const router = express.Router();
const { inscription } = require('../controllers/inscription');
const { connexion, deconnexion } = require('../controllers/connexion');
const { allspectacles, spectaclesavenir, spectacle } = require('../controllers/spectacles');
const { allUsers, editUser, updateUser, deleteUser } = require('../controllers/utilisateurs');
const { send } = require('../controllers/email');
const { allEvenements, addEvenement, addView, editEvenement, updateEvenement, deleteEvenement, participants } = require('../controllers/evenements');
const { allGroupes, addViewg, addGroupe, editGroupe, updateGroupe, deleteGroupe } = require('../controllers/groupes');
const { deleteparticipant, addparticipant } = require('../controllers/participants');


router.get('/', spectaclesavenir);

router.get('/inscription', function (req, res) { res.render('inscription') });
router.get('/connexion', function (req, res) { res.render('connexion') });
router.post('/inscription', inscription);
router.post('/connexion', connexion);
router.get('/logout', deconnexion);

router.get('/calendrier', function (req, res) { res.render('calendrier') });

router.get('/spectacles', allspectacles);

router.get('/contact', function (req, res) { res.render('contact') });

router.post('/send', send);

router.get('/admin', function (req, res) {

    if (req.session.role == "admin") {
        res.render('admin/home', { layout: 'adminmain' })
    }
    else {
        res.redirect('/');
    }

});


// Utilisateurs routes
router.get('/admin/utilisateurs', allUsers);
router.get('/admin/utilisateurs/edit/:id', editUser);
router.post('/admin/utilisateurs/update/:id', updateUser);
router.get('/admin/utilisateurs/delete/:id', deleteUser);

// Groupes routes
router.get('/admin/groupes', allGroupes);
router.get('/admin/groupes/add', addViewg);
router.post('/admin/groupes/add', addGroupe);
router.get('/admin/groupes/edit/:id', editGroupe);
router.post('/admin/groupes/update/:id', updateGroupe);
router.get('/admin/groupes/delete/:id', deleteGroupe);

// Evenements routes
router.get('/admin/evenements', allEvenements);
router.get('/admin/evenements/add', addView);
router.post('/admin/evenements/add', addEvenement);
router.get('/admin/evenements/edit/:id', editEvenement);
router.post('/admin/evenements/update/:id', updateEvenement);
router.get('/admin/evenements/delete/:id', deleteEvenement);

router.get('/admin/evenements/participants/:id', participants);
router.get('/admin/evenements/participants/delete/:id', deleteparticipant);

// Participants routes
router.get('/admin/participants/add/:id', addparticipant);
router.get('/admin/participants/delete/:id', deleteparticipant);


router.get('/spectacles/groupe/:id', spectacle);

module.exports = router;

