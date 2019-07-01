# 1.查询同时存在1课程和2课程的情况
SELECT studentId FROM student_course s WHERE  s.courseId IN ('1','2') GROUP BY s.studentId HAVING COUNT(s.courseId)=2;

# 2.查询同时存在1课程和2课程的情况
SELECT NAME FROM student WHERE id IN (SELECT studentId FROM student_course s WHERE  s.courseId IN ('1','2') GROUP BY s.studentId HAVING COUNT(s.courseId)=2);

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
SELECT s.id,s.name,AVG(sc.score) FROM student s LEFT JOIN student_course sc ON s.id=sc.`studentId` GROUP BY s.id HAVING AVG(sc.`score`)>=60;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
SELECT * FROM student s WHERE s.`id` IN (SELECT sc.studentId FROM student_course sc WHERE sc.`score`=0);

# 5.查询所有有成绩的SQL
SELECT DISTINCT * FROM student s WHERE s.id NOT IN (SELECT DISTINCT sc.studentId FROM student_course sc WHERE sc.`score` <=0);

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
SELECT * FROM student s WHERE s.`id` IN ( SELECT sc.studentId FROM student_course sc WHERE sc.`courseId` IN('1','2') GROUP BY sc.`studentId` HAVING COUNT(sc.`courseId`)=2);

# 7.检索1课程分数小于60，按分数降序排列的学生信息
SELECT s.id,s.`name`,s.age,s.sex,sc.`courseId`,sc.score FROM student s LEFT JOIN student_course sc ON s.id = sc.`studentId` WHERE s.`id` IN ( SELECT sc.studentId FROM student_course sc WHERE sc.`courseId` IN('1') AND sc.`score` < 60) AND sc.`courseId`=1 ORDER BY sc.`score` DESC;

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
SELECT sc.courseId,AVG(sc.score) FROM student_course sc GROUP BY sc.`courseId` ORDER BY AVG(sc.`score`) DESC,sc.`courseId` ASC;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
SELECT s.name,sc.score FROM student s LEFT JOIN student_course sc ON s.`id`=sc.studentId WHERE sc.`courseId`=2 AND sc.`score`<60;
