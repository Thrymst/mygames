//screen pause

if screenPause(){exit;};

//fade out
alpha -= alphaSpd;
if alpha <= 0 {instance_destroy();};