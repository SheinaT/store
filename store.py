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
    name = request.POST.get("name")
    if not name:
        return json.dumps({'STATUS': 'ERROR', 'MSG': 'NAME PARAMETER IS MISSING', 'CODE': 400})

    try:
        with connection.cursor() as cursor:
            query="Select * From categories WHERE NAME= '{}'".format(name)
            cursor.execute(query)
            result = cursor.fetchone()
            if result:
                return json.dumps({'STATUS':'ERROR', 'MSG': 'CATEGORY ALREADY EXISTS', 'CODE':200})

            sql = "INSERT INTO categories (Name) VALUES ('{}' )".format(name)
            cursor.execute(sql)
            connection.commit()
            Cat_ID= cursor.lastrowid
        return json.dumps({'STATUS':'SUCCESS','CAT_ID': Cat_ID,'CODE':201})
    except Exception:
        return json.dumps({'STATUS':'ERROR','MSG':'INTERNAL ERROR','CODE':500})


@delete("/category/<id>")
def delete_category(id):
    try:
        with connection.cursor() as cursor:
            query = "SELECT * FROM categories WHERE id={}".format(id)
            cursor.execute(query)
            result = cursor.fetchone()
            if not result:
                return json.dumps({'STATUS': 'ERROR', 'MSG': 'CATEGORY NOT FOUND', 'CODE': 400})

            sql = "DELETE FROM categories WHERE id = {}".format(id)
            cursor.execute(sql)
            connection.commit()
        return json.dumps({'STATUS': 'SUCCESS','CODE': 201})
    except Exception:
        return json.dumps({'STATUS': 'ERROR', 'MSG': 'INTERNAL ERROR', 'CODE': 500})


# @post("/product")
# def get_category():
#     name = request.POST.get("name")
#     if not name:
#         return json.dumps({'STATUS': 'ERROR', 'MSG': 'NAME PARAMETER IS MISSING', 'CODE': 400})
#
#     try:
#         with connection.cursor() as cursor:
#             query="Select * From categories WHERE NAME= '{}'".format(name)
#             cursor.execute(query)
#             result = cursor.fetchone()
#             if result:
#                 return json.dumps({'STATUS':'ERROR', 'MSG': 'CATEGORY ALREADY EXISTS', 'CODE':200})
#
#             sql = "INSERT INTO categories (Name) VALUES ('{}' )".format(name)
#             cursor.execute(sql)
#             connection.commit()
#             Cat_ID= cursor.lastrowid
#         return json.dumps({'STATUS':'SUCCESS','CAT_ID': Cat_ID,'CODE':201})
#     except Exception:
#         return json.dumps({'STATUS':'ERROR','MSG':'INTERNAL ERROR','CODE':500})


@get("/categories")
def list_category():
    try:
        with connection.cursor() as cursor:
            sql="Select * From categories"
            cursor.execute(sql)
            result = cursor.fetchall()
            connection.commit()
            return json.dumps({'STATUS':'SUCCESS','CATEGORIES':result,'CODE':200})
    except Exception:
        return json.dumps({'STATUS':'ERROR','MSG':'INTERNAL ERROR','CODE':500})



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
    run(host='localhost', port=7001)
if __name__ == '__main__':
    main()

