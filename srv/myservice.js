const srvdemo1 = function(srv)
{
  srv.on('myFunction' , (req,res) => {
       return req.data.msg
  })
}

module.exports = srvdemo1;