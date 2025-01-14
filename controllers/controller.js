"use strict";

const express = require("express");
const app = express();
const multer = require("multer");
app.use(multer().none());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

const model = require("../models/model");

async function getAllUsers(req,res,next){
    try {
        const users = await model.getAllUsers();
        res.json(users);
      } catch (err) {
        next(err);
        //res.status(500).json({ error: "Failed to fetch users" });
      }
    
}
async function getAllTourneys(req,res,next){
    try {
        const data = await model.getAllTourneys()
        const allD  = [];
        for(const tid of data){
            const tourney = await model.getTourney(tid.tourney_id);
            const brackets =  await model.getTourneyBrackets(tid.tourney_id);
            const attendies = await model.getBracketAttendies(tid.tourney_id);

            const combine = {tourney,brackets,attendies};
            allD.push(combine);
        }        
        res.json(allD);
      } catch (err) {
        next(err);
        //res.status(500).json({ error: "Failed to fetch users" });
      }
    
}
async function getUser(req, res, next) {
    const user_id = req.params.user_id.replace ( /[^\d.]/g, '' );//replaces user_id= so we just get the id
    try {
        const user = await model.getUser(user_id);
        if (user) {
            res.json(user);
        } else {
            //errstring  += user_id;
            res.status(404).send({ error: "User not found"});
        } 
    } catch (err) {
        console.error("Error fetching user:", err.message);
        res.status(500).send({ error: "Failed to fetch user data -C" });
        next(err);
    }
}
    //take player history
    //what places are they getting in this bracket
    //what players do they struggle against in bracket
    //normalize
async function generateSeeding(req, res, next){

}
async function signUp(req, res, next){
    try{
        const {user_id, first_name, last_name, email, tag, password, title} = req.body;
        if(!user_id || !first_name || !last_name || !email || !tag ||!password || !title){
            return res.status(400).send('Missing required parameters');
        }
    }catch(error){
        next(error);
    }
}
//gets all info about tourney
async function getTourney(req, res, next){
    const tourney_id = req.params.tourney_id.replace ( /[^\d.]/g, '' );
    try {
        const tourney = await model.getTourney(tourney_id);
        const brackets = await model.getTourneyBrackets(tourney_id);
        const attendies = await model.getBracketAttendies(tourney_id);

        const combined = {tourney,brackets,attendies};
        res.json(combined);
      } catch (err) {
        next(err);
        //res.status(500).json({ error: "Failed to fetch users" });
      }
}
async function getTourneyAttendies(req, res, next){
    const tourney_id = req.params.tourney_id.replace ( /[^\d.]/g, '' );
    try {
        const tourney = await model.getTourney(tourney_id);
        const brackets = await model.getTourneyBrackets(tourney_id);
        res.json(combined);
      } catch (err) {
        next(err);
        //res.status(500).json({ error: "Failed to fetch users" });
      }
}
//this could get the attendies from the brackets + our attendies
async function getTourneyBrackets(req, res, next){
    const tourney_id = req.params.tourney_id.replace ( /[^\d.]/g, '' );
    try {
        const bracket = await model.getTourneyBrackets(tourney_id);
        res.json(bracket);
      } catch (err) {
        next(err);
        //res.status(500).json({ error: "Failed to fetch users" });
      }
}
async function getBracket(req, res, next){
    const bracket_id = req.params.bracket_id.replace ( /[^\d.]/g, '' );
    try {
        const bracket = await model.getTourneyBrackets(bracket_id);
        res.json(bracket);
      } catch (err) {
        next(err);
        //res.status(500).json({ error: "Failed to fetch users" });
      }
}


module.exports = {
    getAllUsers,
    getAllTourneys,
    getUser,
    getTourney,
    getTourneyBrackets,
    getBracket
}