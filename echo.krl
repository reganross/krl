ruleset hello_world {
  meta {
    name "Hello World"
    description <<
A first ruleset for the Quickstart
>>
    author "Regan Ross"
    logging on
    sharing on
    provides hello
 
  }
  global {
    hello = function(obj) {
      msg = "Hello " + obj
      msg
    };
 
  }
  rule hello_world is active {
    select when echo hello
    send_directive("say") with
      something = "Hello World";
  }

  rule message is active {
  	select when echo message input "(.*)" setting(m)
  	send_directive("say") with
  		something = m;
    always {
      log "Echo " + m
    }
  }
 
}