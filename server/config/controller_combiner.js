var requireFolder = require("./../config/req_folder.js");
var controllers = requireFolder("controllers");
var exps = {};

for(let key in controllers){

	for(let alreadyHas in controllers[key]){
		if(exps.hasOwnProperty(alreadyHas)){
			console.log("WARNING: Name collision in controller functions. Function:", alreadyHas);
			console.log("file:", key);
		}
	}

	exps = Object.assign(exps, controllers[key]);
}

module.exports = exps;