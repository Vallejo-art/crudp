from flask import Flask, render_template, request, redirect, url_for, flash, session
from flask_mysqldb import MySQL,MySQLdb
import bcrypt


app = Flask(__name__)
#conexion de mysql 
app.config['MYSQL_HOST'] ='localhost'
app.config['MYSQL_USER'] ='alexis'
app.config['MYSQL_PASSWORD'] ='tec'
app.config['MYSQL_DB'] ='basepy'
mysql = MySQL(app)

# settings
app.secret_key = 'mysecretkey'

@app.route('/')
def main():
    if 'nombre' in session:
        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM contacts')
        data = cur.fetchall()
        return render_template('index.html', contacts = data)
    else:
        return render_template('login.html')    

@app.route('/')
def Index():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM contacts')
    data = cur.fetchall()
    return render_template('index.html', contacts = data)

@app.route('/registrar', methods=["GET","POST"])
def registrar():
    if request.method == 'GET':
        return render_template("registrar.html")
    else:
       nombre = request.form['nombre']
       usuario = request.form['usuario']
       contraseña = request.form['contraseña'].encode('utf-8')
       hash_password = bcrypt.hashpw(contraseña, bcrypt.gensalt())
       cur = mysql.connection.cursor()
       cur.execute('INSERT INTO usuario (nombre, usuario, contraseña) VALUES(%s, %s, %s)',(nombre, usuario, hash_password,))
       mysql.connection.commit()
       session['nombre'] = request.form['nombre']
       session['usuario'] = request.form['usuario']
       return redirect(url_for('Index'))
    


@app.route('/add_contact', methods=['POST'])
def add_contact():
    if request.method == 'POST':
        fullname = request.form['fullname']
        phone = request.form['phone']
        email = request.form['email']
        cur = mysql.connection.cursor()
        cur.execute ('INSERT INTO contacts (fullname, phone, email) VALUES (%s, %s, %s)',
        (fullname, phone, email))
        mysql.connection.commit()
        flash('Agregado')
        return redirect(url_for('Index'))

#login
@app.route('/login',methods=["GET","POST"])
def login():
    if request.method == 'POST':
        usuario = request.form['usuario']
        contraseña = request.form['contraseña'].encode('utf-8')

        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM usuario WHERE usuario=%s",(usuario,))
        usuario = cur.fetchone()
        cur.close()

        if len(usuario) > 0:
            if bcrypt.hashpw(contraseña, usuario["contraseña"].encode('utf-8')) == usuario["contraseña"].encode('utf-8'):
                session['nombre'] = usuario['nombre']
                session['usuario'] = usuario['usuario']
                cur = mysql.connection.cursor()
                cur.execute('SELECT * FROM contacts')
                data = cur.fetchall()
                flash('Acceso exitoso', 'altert-danger')
                return redirect(url_for('Index', contact = data))
                #return render_template("index.html")
            else:
                return "Error password and email not match"
        else:
            return "Error user not found"
    else:
        return render_template("login.html")

    
@app.route('/logout', methods=["GET", "POST"])
def logout():
    session.clear()
    return redirect(url_for('Index'))

#

@app.route('/edit/<id>')
def get_contact(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM contacts WHERE id = {0}'.format(id))
    data = cur.fetchall()
    print(data[0])
    return render_template('edit-contact.html', contact = data[0])

    

@app.route('/update/<id>', methods = ['POST'])
def update_contact(id):
    if request.method == 'POST':
           fullname = request.form['fullname']
    phone = request.form['phone']
    email = request.form['email']
    cur = mysql.connection.cursor()
    cur.execute("""
    UPDATE contacts
    SET fullname = %s,
     email = %s,
     phone = %s
     WHERE id = %s
    """, (fullname, email, phone, id))
    mysql.connection.commit()
    flash('Contacto actualizado correctamente')
    return redirect(url_for('Index'))
     


@app.route('/delete/<string:id>')
def delete_contact(id):
    cur = mysql.connection.cursor()
    cur.execute('DELETE FROM contacts WHERE id = {0}'.format(id))
    mysql.connection.commit()
    flash('contact removed successfully')
    return redirect(url_for('Index'))

if __name__ == "__main__":
    pass
app.run(port= 3000, debug=True)