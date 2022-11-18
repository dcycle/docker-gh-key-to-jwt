// https://stackoverflow.com/a/64492227/1207752

const crypto = require('crypto')
const fs = require('fs')
const jwt = require('jsonwebtoken')

const path_to_pem = '/pem/' + process.env.PEM_FILE;
const app_id = process.env.APP_ID;

// assuming you have a private.key file that begins with '-----BEGIN RSA PRIVATE KEY-----...'
fs.readFile(path_to_pem, (err, data) => {
  const privateKey = data.toString();
  const currentDateTime = new Date();
  const nowInSeconds = currentDateTime.getTime() / 1000;
  const iat = Math.floor(nowInSeconds - 60);
  const exp = Math.floor(nowInSeconds + (10 * 60));

  // Generate the JWT
  payload = {
    iat: iat,
    exp: exp,
    iss: app_id
  }

  console.log(jwt.sign(payload, privateKey, { algorithm: 'RS256'}));
});
