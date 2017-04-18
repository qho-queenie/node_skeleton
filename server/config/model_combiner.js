var requireFolder = require("./../config/req_folder.js");
var models = requireFolder("models");
var exps = {};

for(let key in models){
	for(let alreadyHas in models[key]){
		if(exps.hasOwnProperty(alreadyHas)){
			console.log("WARNING: Name collision in model functions. Function:", alreadyHas);
			console.log("file:", key);
		}
	}
	exps = Object.assign(exps, models[key]);
}

module.exports = exps;