import psycopg2
from logging import info

class DeloreanLibrary():
    
    # Metodos Python são reconhecidos como KW automagicamente pelo Robot
    # remove student email@desejado.com
    def remove_student(self, email):

        query = "delete from students where email  = '{}'".format(email)
        info(query)

        conn = psycopg2.connect(
            host='ec2-23-21-229-200.compute-1.amazonaws.com',
            database='dai6l32g2tis5l',
            user='wdxdpikabhsxim',
            password='2c5a8af0623ca9a329e474046cd2eebed8673aa22d9b444cce2e2d620a7e5937'
        )

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()
