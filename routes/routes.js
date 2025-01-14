"use strict";
const express = require("express");
const router = express.Router();
const controller = require("../controllers/controller");



//app.use("/api", routes); 
router.get("/allusers", controller.getAllUsers);
router.get("/user/:user_id",controller.getUser);
router.get("/tourney/:tourney_id",controller.getTourney);//gets a tourney
//router.get("/tourneybrackets/:tourney_id",controller.getTourney);//gets a tourney
router.get("/bracket/:tourney_id",controller.getTourneyBrackets);//gets a tourneys brackets
router.get("/alltourneys",controller.getAllTourneys);

//router.post("/signup",controller.)

module.exports = router;