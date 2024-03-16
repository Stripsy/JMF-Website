const express = require('express');
const exphbs = require('express-handlebars');
const session = require('express-session');
const bodyParser = require('body-parser')
const rateLimit = require('express-rate-limit')
const flash = require('express-flash')
const moment = require("moment");

const app = express();
const port = process.env.PORT || 5000;

app.use(session({
    secret : 'keyboard cat',
    resave : false,
    saveUninitialized : true
}));

app.use(function(req, res, next){
    res.locals.session = req.session;
    next();
    });

const router = require('./routes/index');

app.use(express.json());
app.use(express.urlencoded({extended:true}));
app.use(express.static('public'));
app.use(bodyParser.json())

app.engine('hbs', exphbs.engine({extname:".hbs",
helpers:{
    ifCond: function (v1, v2, options) {
        if (v1 === v2) {
            return options.fn(this);
        }
        return options.inverse(this);
      },
      dateFormat: function(date, options){
        const formatToUse = (arguments[1] && arguments[1].hash && arguments[1].hash.format) || "DD/MM/YYYY"
        return moment(date).format(formatToUse);
      }
}
}))

app.use(flash());

const apiLimiter = rateLimit({
	windowMs: 15 * 60 * 1000, // 15 minutes
	max: 10, // Limit each IP to 100 requests per `window` (here, per 15 minutes)
	standardHeaders: true, // Return rate limit info in the `RateLimit-*` headers
    message: "Vous avez effectué trop de requêtes veuillez patienter",
	legacyHeaders: false, // Disable the `X-RateLimit-*` headers
})

app.use('/inscription', apiLimiter)
app.use('/send', apiLimiter)


app.set('view engine', 'hbs');

app.use('/', router);

app.listen(port, ()=>{
    console.log(`Serveur sur le port ${port}`)
})

