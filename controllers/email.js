const nodemailer = require('nodemailer');


const send = async (req, res) => {

  const { nom, email, telephone, message } = await req.body;

  var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: 'jmfrancewebsite@gmail.com',
      pass: 'Jm$123456'
    }
  });

  var mailOptions = {
    from: 'jmfrancewebsite@gmail.com',
    to: 'jmfrancewebsite@gmail.com',
    subject: nom,
    text: message + " " + email + " " + telephone
  };

  transporter.sendMail(mailOptions, function (error, info) {
    if (error) {
      req.flash('mailfail', "Une erreur s'est produite veuillez réssayer plus tard !");
      res.redirect('/contact');
    } else {
      req.flash('mailsuccess', "Votre email a bien été envoyé !");
      res.redirect('/contact');
    }
  });

}

module.exports = {
  send
}