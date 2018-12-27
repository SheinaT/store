from bottle import route, run, template, static_file, get, post, delete, request
from sys import argv
import json
import pymysql


connection = pymysql.connect(host='localhost',
                             user='root',
                             password='shayshay',
                             db='store',
                             charset='utf8mb4',
                             autocommit=True,
                             cursorclass=pymysql.cursors.DictCursor)
cursor = connection.cursor()


@get("/admin")
def admin_portal():
	return template("pages/admin.html")

@post("/category")
def get_category():
    try:
        with connection.cursor() as cursor:
            name = request.POST.get("name")
            sql = "INSERT INTO category VALUES (0,'{}')".format(name)
            cursor.execute(sql)
            connection.commit()
            result = cursor.fetchall()
        return json.dumps({'STATUS':'SUCCESS','MSG':result,'CODE':201})

    except Exception as e:
        print (repr(e))
        return json.dumps({'STATUS':'ERROR','MSG':'Category Already Exists'})


@get("/")
def index():
    return template("index.html")


@get('/js/<filename:re:.*\.js>')
def javascripts(filename):
    return static_file(filename, root='js')


@get('/css/<filename:re:.*\.css>')
def stylesheets(filename):
    return static_file(filename, root='css')


@get('/images/<filename:re:.*\.(jpg|png|gif|ico)>')
def images(filename):
    return static_file(filename, root='images')


def main():
    run(host='localhost', port=7000)
if __name__ == '__main__':
    main()

