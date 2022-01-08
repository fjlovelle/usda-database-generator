import os
import sqlite3
import datetime

def main():

    path = './database.db'
    con = sqlite3.connect(path)
    cur = con.cursor()
    cur.execute (
        '''
        CREATE TABLE "version" (
            "id" INTEGER,
            "tag" TEXT,
            "date" TEXT,
            "description" TEXT,
            PRIMARY KEY ("id")
        );
        '''
    )
    cur.execute (
        '''
        INSERT INTO "version"
            ("id", "tag", "date", "description")
        VALUES
            (1, "1.0.0", "%s", "First database");
        ''' % datetime.datetime.now()
    )
    con.commit()
    con.close()

# Start program in the main function
if __name__ == '__main__': main()