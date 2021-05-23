const crypto = require('crypto');

function encrypt(data) {
    var cipher = crypto.createCipher('aes256', '31460b08fe4f95004617c9d4b5de4ffee0affb43');
    var encrypted = cipher.update(data, 'utf8', 'hex') + cipher.final('hex');
    return encrypted;
}


var value = process.argv;

if(value && value[2] !== undefined)
    console.log(encrypt(value[2]));
else
    console.log('Valor não recebido.');