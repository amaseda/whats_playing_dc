var app = {
  els: {
    form: document.querySelector("form"),
    email: document.querySelector("[type='email']")
  },
  listen: function(){
    this.els.form.addEventListener("submit", this.subscribe.bind(this))
  },
  subscribe: function(e){
    e.preventDefault()
    var self = this
    $.post("/signup", {email: this.els.email.value})
     .then(function(response){
       $(self.els.email).fadeOut(function(){
	 $(self.els.form).html("<p>You're on the list!</p>").hide().fadeIn()
       })
     })
     .fail(function(response){
       alert("there was an error") 
     })
  }
}

app.listen()