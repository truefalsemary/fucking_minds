CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


CREATE TYPE UserRole AS ENUM ('student', 'teacher', 'admin');
CREATE TYPE UserType AS ENUM ('anonymous', 'general', 'super');
CREATE TYPE StatusCode AS ENUM (
    'not_sent',    
    'submitted',  
    'in_review',   
    'reviewed',   
    'completed'   
);

-- status code enum's elements will be discussed

CREATE TABLE IF NOT EXISTS Users (
    user_id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    current_user_type UserType NOT NULL DEFAULT 'general',
    user_email VARCHAR(255) NOT NULL UNIQUE,
    user_password TEXT NOT NULL,
    user_name VARCHAR(255) DEFAULT NULL,
    user_surname VARCHAR(255) DEFAULT NULL,
    user_middle_name VARCHAR(255) DEFAULT NULL
);


CREATE TABLE IF NOT EXISTS Auth_sessions (
    id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id TEXT NOT NULL,
    updated TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


CREATE TABLE IF NOT EXISTS Courses (
    course_id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    course_title VARCHAR(255) NOT NULL,
    course_description TEXT NOT NULL,
    author_id TEXT NOT NULL,
    start_ts TIMESTAMPTZ,
    end_ts TIMESTAMPTZ,
    FOREIGN KEY (author_id) REFERENCES Users(user_id)
);


CREATE TABLE IF NOT EXISTS Lessons (
    lesson_id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    lesson_title VARCHAR(255) NOT NULL,
    lesson_description TEXT NOT NULL,
    author_id TEXT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Users(user_id)
);


CREATE TABLE IF NOT EXISTS Materials (
    material_id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    material_title VARCHAR(255) NOT NULL,
    content_link TEXT NOT NULL,
    author_id TEXT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Users(user_id)
);


CREATE TABLE IF NOT EXISTS Tasks (
    task_id TEXT PRIMARY KEY DEFAULT uuid_generate_v4(),
    task_title VARCHAR(255) NOT NULL,
    content_link TEXT NOT NULL,
    author_id TEXT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Users(user_id)
);


CREATE TABLE IF NOT EXISTS User_Course (
    user_id TEXT NOT NULL,
    course_id TEXT NOT NULL,
    user_role UserRole NOT NULL,
    CONSTRAINT user_course_pkey PRIMARY KEY (user_id, course_id, user_role),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Course_Lesson (
    course_id TEXT NOT NULL,
    lesson_id TEXT NOT NULL,
    CONSTRAINT course_lesson_pkey PRIMARY KEY (course_id, lesson_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE,
    FOREIGN KEY (lesson_id) REFERENCES Lessons(lesson_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Lesson_Material (
    lesson_id TEXT NOT NULL,
    material_id TEXT NOT NULL,
    CONSTRAINT lesson_material_pkey PRIMARY KEY (lesson_id, material_id),
    FOREIGN KEY (lesson_id) REFERENCES Lessons(lesson_id) ON DELETE CASCADE,
    FOREIGN KEY (material_id) REFERENCES Materials(material_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Lesson_Task (
    lesson_id TEXT NOT NULL,
    task_id TEXT NOT NULL,
    CONSTRAINT lesson_task_pkey PRIMARY KEY (lesson_id, task_id),
    FOREIGN KEY (lesson_id) REFERENCES Lessons(lesson_id) ON DELETE CASCADE,
    FOREIGN KEY (task_id) REFERENCES Tasks(task_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Course_Lesson_Task (
    course_id TEXT NOT NULL,
    lesson_id TEXT NOT NULL,
    task_id TEXT NOT NULL,
    present_time TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    submission_deadline TIMESTAMPTZ,
    review_deadline TIMESTAMPTZ,
    score INT,
    CONSTRAINT course_lesson_task_pkey PRIMARY KEY (course_id, lesson_id, task_id),
    FOREIGN KEY (course_id, lesson_id) REFERENCES Course_Lesson(course_id, lesson_id) ON DELETE CASCADE,
    FOREIGN KEY (lesson_id, task_id) REFERENCES Lesson_Task(lesson_id, task_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Sended_Tasks (
    student_id TEXT NOT NULL,
    student_role UserRole NOT NULL DEFAULT 'student' CHECK (student_role = 'student'),
    task_id TEXT NOT NULL,
    course_id TEXT NOT NULL,
    lesson_id TEXT NOT NULL,
    status StatusCode NOT NULL DEFAULT 'not_sent',
    score INT NOT NULL,
    reviewer_id TEXT,
    reviewer_role UserRole NOT NULL DEFAULT 'teacher' CHECK (reviewer_role = 'teacher'),
    CONSTRAINT sended_task_pkey PRIMARY KEY (student_id, task_id, course_id, lesson_id),
    FOREIGN KEY (student_id, course_id, student_role) REFERENCES User_Course(user_id, course_id, user_role) ON DELETE CASCADE,
    FOREIGN KEY (task_id, course_id, lesson_id) REFERENCES Course_Lesson_Task(task_id, course_id, lesson_id) ON DELETE CASCADE,
    FOREIGN KEY (reviewer_id, course_id, reviewer_role) REFERENCES User_Course(user_id, course_id, user_role) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS TaskSubmissions (
    student_id TEXT NOT NULL,
    task_id TEXT NOT NULL,
    course_id TEXT NOT NULL,
    lesson_id TEXT NOT NULL,
    send_ts TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    content_link TEXT NOT NULL,
    FOREIGN KEY (student_id, task_id, course_id, lesson_id) REFERENCES Sended_Tasks(student_id, task_id, course_id, lesson_id) ON DELETE CASCADE
);