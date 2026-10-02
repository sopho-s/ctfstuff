<html>
  <head>
    <title>Is it down?</title>
    <link rel="stylesheet" href="static/general.css" />
    <script src="static/general.js "></script>
  </head>
  <body>
    <div class="center base">
      <div class="top-down card center-rows">
        <h1>Is it down?</h1>
        <form
          class="center-rows top-down space-between"
          style="gap: 10px"
          id="ping" 
        >
          <input
            class="form-text"
            type="text"
            placeholder="google.com"
            name="website"
          />
          <input class="login-button" type="submit" value="Check availability" />
        </form>
        <p>
          <?php
            if (isset($_GET["website"])) {
                if (true) {
                  print shell_exec("ping -c 1 " . $_GET["website"] . " 2>&1");
                } else {
                  print "command not allowed";
                }
            }
        ?>
        </p>
      </div>
    </div>
  </body>
</html>
