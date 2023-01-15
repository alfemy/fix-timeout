<?php
//set_time_limit(120);

# Every 10 seconds, write a message to the log
for ($i = 0; $i < 11; $i++) {
    sleep(10);
    error_log("Still running for " . ($i + 1) * 10 . " seconds");
}
error_log("Done!");
?>
<p>Done!</p>
