const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim:true, // => // '    sky    ' => 'sky'
    },
    email: {
        required: true,
        type: String,
        trim:true, 
        validate: {
            validator:(value) => {
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: "Please enter a valid email adress !"
        },     
    },
    password: {
        required: true,
        type: String,
        // validate: {
        //     validator:(value) => {
        //          return value.length > 6;
        //     },
        //     message: "Please enter a long password"
        // },   
    },
    adress: {
        type: String,
        default: ' ',
    },
    type:{ // you will add admin,seller in the future 
        type: String,
        default: 'user'
    }

})

const User = mongoose.model('User', userSchema)

module.exports = User