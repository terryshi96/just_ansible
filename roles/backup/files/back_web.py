# -*- encoding: utf-8 -*-

from subprocess import call
import os
import time
import functools
import logging


# 修改此处配置可以实现备份不同数据库
db_config = {
    'xxx': {'database': 'xxxx', 'username': 'xxxx', 'password': 'xxxxxx', 'bucket': 'xxx'},
}

# 日志文件名称，与备份脚本在同一目录下
LOG_FILE = 'test_db.log'

# 备份位置， 具体位置为 backup + dbname
backup_dir = '/home/postgres/pgdata/back/'

# 设置保留备份的天数,其余的上传到阿里云存储, 其余通过基础备份的方式上传至阿里云归档存储
keep_back_archive = 3

# 文件时间戳
file_time = time.strftime('%Y_%m_%d_%H', time.localtime(time.time()))


logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s',
                    datefmt='%a, %d %b %Y %H:%M:%S',
                    filename=LOG_FILE)


# 计算函数执行时间，写入日志
def loghandler(func):
    @functools.wraps(func)
    def wrapper():
        start = time.time()
        func()
        end = time.time()
        run_time = end - start
        if run_time > 60:
            logging.info('The {func} run time is {time} minutes.'.format(func=func.__name__, time=(run_time/60)))
        else:
            logging.info('The {func} run time is {time} seconds.'.format(func=func.__name__, time=run_time))
    return wrapper


@loghandler
def back_db():
    for item in db_config.keys():
        os.environ['PGPASSWORD'] = db_config[item]['password']
        call('pg_dump -E UTF8 --username={username} --dbname={database} --compress=9 -f {back_db_dir}/{time}.sql.gz'.format(
            database=db_config[item]['database'],
            back_db_dir=os.path.join(backup_dir, db_config[item]['database']),
            username=db_config[item]['username'],
            time=file_time), shell=True)


# 清理过期的备份文件
def clean_dir():
    for item in db_config.keys():
        backup_db_dir = os.path.join(backup_dir, db_config[item]['database'])

        # 根据文件的生成时间对文件进行排序
        def compare(x, y):
            stat_x = os.stat(os.path.join(backup_db_dir, x))
            stat_y = os.stat(os.path.join(backup_db_dir, y))
            if stat_x.st_ctime < stat_y.st_ctime:
                return -1
            elif stat_x.st_ctime > stat_y.st_ctime:
                return 1
            else:
                return 0

        files = os.listdir(backup_db_dir)
        files.sort(compare)
        length = len(files)

        cur = 0
        while cur <= length - keep_back_archive - 1:
            full_path = os.path.join(backup_db_dir, files[cur])
            call('rm -f {full_path}'.format(full_path=full_path), shell=True)
            cur = cur + 1


@loghandler
def up_load_to_oas():
    for item in db_config.keys():
        call('cd {back_db_dir}; oascmd.py upload oas://{bucket} {time}.sql.gz'.format(
            back_db_dir=os.path.join(backup_dir, db_config[item]['database']),
            database=db_config[item]['database'],
            bucket=db_config[item]['bucket'],
            time=file_time
        ), shell=True)


if __name__ == '__main__':
    back_db()
    up_load_to_oas()
    clean_dir()
