import csv
import os
import sqlite3
import sys

def main():

    if (len(sys.argv) == 2):
        if (os.path.exists(sys.argv[1])):
            tablename = os.path.splitext(os.path.basename(sys.argv[1]))[0]
            header, data = read_csv(sys.argv[1])

            path = './database.db'
            create_sql_database(path, tablename, header, data)

def read_csv(filename):

    data      = []
    header    = []

    with open(filename, mode ='r') as file:
        csv_reader = csv.reader(file)
        header = next(csv_reader)
        for line in csv_reader:
            data.append(line)

    return (header, data)

def create_sql_database (path, tablename, header, data):
    
    con = sqlite3.connect(path)
    cur = con.cursor()
    cur.execute(create_sql_table(tablename, header))
    cur.execute(create_sql_rows(tablename, header, data))
    con.commit()
    con.close()

def create_sql_table (tablename, header):

    output = ''

    if (len(header) > 1):
        output += 'CREATE TABLE "' + tablename + '" (\n'
        for field in header:
            output += '    "' + field + '" TEXT,\n'
        output += '    PRIMARY KEY ("' + header[0] + '")\n'
        output += ');\n\n'

    return output

def create_sql_rows (tablename, header, lines):

    output = ''

    output += 'INSERT INTO "' + tablename + '"\n    ('
    for i, field in enumerate(header):
        if (i < (len(header) - 1)):
            output += '"' + field + '", '
        else:
            output += '"' + field + '")\n'

    output += 'VALUES\n'
    for i, line in enumerate(lines):
        output += '    ('
        for j, value in enumerate(line):
            value = value.replace('\"', '\"\"')
            if (j < (len(line) - 1)):
                output += '"' + value + '", '
            else:
                output += '"' + value + '"'
        if (i < (len(lines) - 1)):
            output += '),\n'
        else:
            output += ');'

    return output

# Start program in the main function
if __name__ == '__main__': main()