var express = require('express');

// Constants
var PORT = 8080;

// App
var app = express();
app.get('/', function (req, res) {
  res.send('Hello world\n');
});

var mongoose = require('mongoose');
mongoose.connect('mongodb://mongo4/node-mongo');
mongoose.connection.once('open', function(callback){
  console.log('mongoose connection opened at ' + 'mongodb://mongo4/node-mongo');
});
mongoose.connection.on('error', console.log);
mongoose.connection.on('disconnected', console.log);
var Schema = mongoose.Schema;
var UserSchema = new Schema({
  name: String
});

var User = mongoose.model('User', UserSchema);

app.get('/users/add', function(req, res){
  var name = req.param('name');
  var user = new User({name:name});
  user.save(function(err, savedUser){
    if(err){
      console.log(err);
      res.send(err);
    }
    res.json(savedUser);
  });
});

app.get('/users', function(req, res){
  User.find().exec(function(err, users){
    console.log(users);
    res.json(users);
  });
});
  


app.listen(PORT);
console.log('Running on http://localhost:' + PORT);
