ruleset see_song {
  meta {
    name "Hello World"
    author "Regan Ross"
    logging on
  }


  rule songs {
    select when echo message msg_type "song" input "(.*)" setting(m) 
      send_directive("sing") with
        something = m;
      always {
        log "Echo " + m;
        raise explicit event sung
          with song = m;
      }
  }

  rule find_hymn {
    select when explicit sung song "(god)" setting(song)
      always{
        raise explicit event found_hymn;
        log "stuff " + song;
      }
  }
}