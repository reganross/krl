ruleset see_song {
  meta {
    name "Hello World"
    author "Regan Ross"
    logging on
  }
 
  rule hello_world is active {
    select when echo hello
    send_directive("say") with
      something = "Hello World!";
  }

  rule message {
    select when echo message input "(.*)" setting(m)
    send_directive("sing") with
      something = m;
    always {
      log "Echo " + m
    }
  }
}
