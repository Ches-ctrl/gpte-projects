from flask import Flask, render_template
from forms import ContactForm

app = Flask(__name__)
app.config.from_object('config.Config')

@app.route('/')
def index():
    form = ContactForm()
    return render_template('index.html', form=form)

if __name__ == '__main__':
    app.run(debug=True)