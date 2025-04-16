"use strict";
const { urlencoded } = require("express");
const express = require("express");
const router = express.Router();
const controller = require("../controllers/controller");
const bodyParser = require("body-parser");





//app.use("/api", routes); 
router.get("/allusers", controller.getAllUsers);
router.get("/user/:user_id",controller.getUser);
router.get("/tourney/:tourney_id",controller.getTourney);//gets a tourney
//router.get("/tourneybrackets/:tourney_id",controller.getTourney);//gets a tourney
router.get("/bracket/:tourney_id",controller.getTourneyBrackets);//gets a tourneys brackets
router.get("/alltourneys",controller.getAllTourneys);
router.get("/login/:email/:password",controller.login);//we wont really need this
router.post("/login",controller.login);//flesh

router.post("/signup",controller.signUp);
//router.get("/signup",controller.signUp);
//router.post("/loginUser",controller.login);

//router.post("/signup",controller.)

module.exports = router;
