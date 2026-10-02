from flask import Flask, request, render_template_string

app = Flask(__name__)


@app.route('/static/general.css')
def general():
    with open("./html/static/general.css", "r") as f:
        return f.read()

@app.route('/')
def vulnerable():
    name = request.args.get('name', 'unknown')
    template = f'''<html>
                <head>
                    <title>welcome</title>
                    <link rel="stylesheet" href="static/general.css" />
                    <script src="static/general.js "></script>
                </head>
                <body>
                    <div class="center base">
                    <div class="top-down card center-rows">
                        <h1>Hello {name}!</h1>
                        <form
                        class="center-rows top-down space-between"
                        style="gap: 10px"
                        id="ping" 
                        >
                        <input
                            class="form-text"
                            type="text"
                            placeholder="your name"
                            name="name"
                        />
                        <input class="login-button" type="submit" value="your name" />
                        </form>
                    </div>
                    </div>
                </body>
                </html>
                '''
    return render_template_string(template)

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=80)