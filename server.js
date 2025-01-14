const express = require('express');
const routes = require('./routes/routes');

const app = express();
app.use(express.json());

app.use('/',routes);


// Start the server
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});