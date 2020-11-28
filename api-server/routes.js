var list = require('./list.js');
var issue= require('./issue.js');

module.exports = function(app)
{
	app.get('/list',function(req, resp )
		{
			var data = list.list().then((data)=>{

				if(!data)
				{
					return resp.status(400).send({'error':'not found'})
				}


			//var body = JSON.parse(data);
			//return res.json(body);
			//return res.json(data);
			
			return resp.status(200).send(data)
			}
					
			);
		}
	);
	app.get('/issue',function(req, resp )
		{
			var data = issue.issue().then((data)=>{

				if(!data)
				{
					return resp.status(400).send({'error':'not found'})
				}


			//var body = JSON.parse(data);
			//return res.json(body);
			//return res.json(data);
			
			return resp.status(200).send(data)
			}
					
			);
		}
	);
}

