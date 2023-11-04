"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const evg_service_base_1 = require("evg-service-base");
const express = require("express");
const PORT = 8000;
const app = express();
app.get("/", (req, res) => {
    res.send("Hello Guys!!");
});
app.listen(PORT);
console.log(`Running on ${PORT}`);
evg_service_base_1.LoggerManager.WithLogger(() => { console.log('asd'); });
