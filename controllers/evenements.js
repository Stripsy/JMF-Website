const Evenement = require('../models/Evenement');
const Groupe = require('../models/Groupe');
const { Op } = require("sequelize")
require('dotenv').config();

const { google } = require('googleapis');
const Utilisateur = require('../models/Utilisateur');
const CREDENTIALS = JSON.parse(process.env.CREDENTIALS);
const calendarId = process.env.CALENDAR_ID;
const SCOPES = 'https://www.googleapis.com/auth/calendar';
const calendar = google.calendar({ version: "v3" });
const auth = new google.auth.JWT(
    CREDENTIALS.client_email,
    null,
    CREDENTIALS.private_key,
    SCOPES
);


const allEvenements = async (req, res) => {

    const evenements = await Evenement.findAll({
        include: [Groupe],
        raw: true,
        nest: true,
    })

    await res.render('admin/evenements', { evenements, layout: 'adminmain' })

}

const participants = async (req, res) => {

    const { id } = req.params;

    const evenements = await Evenement.findAll({
        include: [Groupe],
        raw: true,
        nest: true,
    })
    console.log(evenements)

    const user = await Utilisateur.findAll({
        include: {
            model: Evenement, where: {
                nom: { [Op.ne]: null },
                idevenement: id
            }
        },
        raw: true,
        nest: true,
    })

    console.log(user)
    await res.render('admin/participants', { evenements, user, layout: 'adminmain' })
}

const addView = async (req, res) => {

    const groupe = await Groupe.findAll({
        raw: true,
    })

    await res.render('admin/addevenement', { groupe, layout: 'adminmain' })

}

const addEvenement = async (req, res) => {

    const { nom, dateevenement, adresse, ville, cp, resume, groupe } = await req.body;

    await Evenement.create({

        nom: nom, dateevenement: dateevenement, adresse: adresse, ville: ville, cp: cp, resume: resume, groupe_idgroupe: groupe

    }).catch(function (err) {
        req.flash('addeventdb', "Impossible d'ajouter l'événement dans la base de données !");
        res.redirect('/admin/evenements');
    });;

    var convert = dateevenement + ':00.000';


    let event = {
        'summary': nom,
        'description': resume,
        'location': adresse + " " + ville,
        'start': {
            'dateTime': convert,
            'timeZone': 'Europe/Paris'
        },
        'end': {
            'dateTime': convert,
            'timeZone': 'Europe/Paris'
        }
    }

    const insertEvent = async (event) => {

        try {
            let response = await calendar.events.insert({
                auth: auth,
                calendarId: calendarId,
                resource: event
            });

            if (response['status'] == 200 && response['statusText'] === 'OK') {
                return 1;
            }

            else {
                return 0;
            }

        } catch (error) {
            req.flash('addeventgc', "Impossible d'ajouter l'événement dans le calendrier !");
            res.redirect('/admin/evenements');
            return 0;
        }
    };

    insertEvent(event)

    req.flash('addeventsuccess', "L'événement a bien été ajouté !");

    await res.redirect('/admin/evenements');
}

const editEvenement = async (req, res) => {

    const { id } = await req.params;

    const evenement = await Evenement.findOne({
        where: {
            idevenement: id
        },
        raw: true
    })

    const groupe = await Groupe.findAll({
        raw: true,
    })

    await res.render('admin/editevenement', { evenement, groupe, layout: 'adminmain' })

}

const updateEvenement = async (req, res) => {

    const { id } = req.params;

    const data = req.body;

    const date = req.body.dateevenement + ':00.000'

    const selector = { where: { idevenement: id } }

    const resume = await Evenement.findAll({
        raw: true,
        nest: true,
        where: {
            idevenement: id
        }
    })

    await Evenement.update(data, selector)


    let start = '2020-10-03T00:00:00.000Z';
    let end = '2030-10-04T00:00:00.000Z';

    const updateEvent = async (eventId) => {

        try {
            let response = await calendar.events.update({
                auth: auth,
                calendarId: calendarId,
                eventId: eventId,
                resource: {
                    start: {
                        dateTime: date,
                        timeZone: 'Europe/Paris'
                    },
                    end: {
                        dateTime: date,
                        timeZone: 'Europe/Paris'
                    }
                }
            });

            if (response.data === '') {
                return 1;
            } else {
                return 0;
            }
        } catch (error) {
            console.log(`Error at deleteEvent --> ${error}`);
            return 0;
        }
    };

    const getEvents = async (dateTimeStart, dateTimeEnd) => {

        try {
            let response = await calendar.events.list({
                auth: auth,
                calendarId: calendarId,
                timeMin: dateTimeStart,
                timeMax: dateTimeEnd,
                timeZone: 'Europe/Paris'
            });

            let items = response['data']['items'];
            return items;
        } catch (error) {
            console.log(`Error at getEvents --> ${error}`);
            return 0;
        }
    };

    getEvents(start, end)
        .then((res) => {

            test = res.find(re => re.description === resume[0].resume)
            let eventId = test.id;

            updateEvent(eventId)
                .then((res) => {

                })
                .catch((err) => {

                });

        })
        .catch((err) => {

        });

    req.flash('editevent', "L'événement a bien été modifié !");

    await res.redirect('../')



}

const deleteEvenement = async (req, res) => {

    const { id } = req.params;

    const selector = { where: { idevenement: id } }

    const resume = await Evenement.findAll({
        raw: true,
        nest: true,
        where: { idevenement: id }
    })

    let start = '2020-10-03T00:00:00.000Z';
    let end = '2030-10-04T00:00:00.000Z';

    const deleteEvent = async (eventId) => {

        try {
            let response = await calendar.events.delete({
                auth: auth,
                calendarId: calendarId,
                eventId: eventId
            });

            if (response.data === '') {
                return 1;
            } else {
                return 0;
            }
        } catch (error) {
            console.log(`Error at deleteEvent --> ${error}`);
            return 0;
        }
    };

    const getEvents = async (dateTimeStart, dateTimeEnd) => {

        try {
            let response = await calendar.events.list({
                auth: auth,
                calendarId: calendarId,
                timeMin: dateTimeStart,
                timeMax: dateTimeEnd,
                timeZone: 'Asia/Kolkata'
            });

            let items = response['data']['items'];
            return items;
        } catch (error) {
            console.log(`Error at getEvents --> ${error}`);
            return 0;
        }
    };

    getEvents(start, end)
        .then((res) => {


            test = res.find(re => re.description === resume[0].resume)
            let eventId = test.id;

            deleteEvent(eventId)
                .then((res) => {
                    console.log(res); // flash bien supprimé
                })
                .catch((err) => {
                    console.log(err);
                });

        })
        .catch((err) => {
            console.log(err);
        });

    await Evenement.destroy(selector)


    req.flash('editevent', "L'événement a bien été supprimé !");

    await res.redirect('../')

}

module.exports = {
    allEvenements, addEvenement, addView, editEvenement, updateEvenement, deleteEvenement, participants
}