const express = require("express");
const app = express();

app.get("/", (req, res) => {
	res.send("Hello from Day-35 of #90DaysOfDevOps - Multi Stage Builds!\n");
});

app.listen(8080, () => console.log("Listening on :8080"));
