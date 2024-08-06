CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


CREATE TYPE user_role AS ENUM ('student', 'teacher', 'admin');
CREATE TYPE user_type AS ENUM ('anonymous ', 'general', 'super');
CREATE TYPE status_code AS ENUM (
    'not_sent',    
    'submitted',  
    'in_review',   
    'reviewed',   
    'completed'   
);

-- status code enum's elements will be discussed


CREATE TABLE Users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    current_user_type user_type NOT NULL,
    user_email VARCHAR(255) NOT NULL UNIQUE,
    user_password BYTEA NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    user_surname VARCHAR(255) NOT NULL,
    user_middle_name VARCHAR(255) DEFAULT NULL
);


CREATE TABLE Auth_sessions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    updated TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


CREATE TABLE Courses (
    course_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    course_title VARCHAR(255) NOT NULL,
    course_description TEXT NOT NULL,
    author_id UUID NOT NULL,
    start_ts TIMESTAMPTZ,
    end_ts TIMESTAMPTZ,
    FOREIGN KEY (author_id) REFERENCES Users(user_id)
);


CREATE TABLE Lessons (
    lesson_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    lesson_title VARCHAR(255) NOT NULL,
    lesson_description TEXT NOT NULL,
    author_id UUID NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Users(user_id)
);


CREATE TABLE Materials (
    material_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    material_title VARCHAR(255) NOT NULL,
    content_link TEXT NOT NULL,
    author_id UUID NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Users(user_id)
);


CREATE TABLE Tasks (
    task_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    task_title VARCHAR(255) NOT NULL,
    content_link TEXT NOT NULL,
    author_id UUID NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Users(user_id)
);


CREATE TABLE User_Course (
    user_id UUID NOT NULL,
    course_id UUID NOT NULL,
    user_role user_role NOT NULL,
    PRIMARY KEY (user_id, course_id, user_role),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


CREATE TABLE Course_Lesson (
    course_id UUID NOT NULL,
    lesson_id UUID NOT NULL,
    PRIMARY KEY (course_id, lesson_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (lesson_id) REFERENCES Lessons(lesson_id)
);


CREATE TABLE Lesson_Material (
    lesson_id UUID NOT NULL,
    material_id UUID NOT NULL,
    PRIMARY KEY (lesson_id, material_id),
    FOREIGN KEY (lesson_id) REFERENCES Lessons(lesson_id),
    FOREIGN KEY (material_id) REFERENCES Materials(material_id)
);


CREATE TABLE Lesson_Task (
    lesson_id UUID NOT NULL,
    task_id UUID NOT NULL,
    PRIMARY KEY (lesson_id, task_id),
    FOREIGN KEY (lesson_id) REFERENCES Lessons(lesson_id),
    FOREIGN KEY (task_id) REFERENCES Tasks(task_id)
);


CREATE TABLE Course_Lesson_Task (
    course_lesson_id UUID NOT NULL,
    lesson_task_id UUID NOT NULL,
    present_time TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    submission_deadline TIMESTAMPTZ,
    review_deadline TIMESTAMPTZ,
    score INT,
    PRIMARY KEY (course_lesson_id, lesson_task_id),
    FOREIGN KEY (course_lesson_id) REFERENCES Course_Lesson(course_id),
    FOREIGN KEY (lesson_task_id) REFERENCES Lesson_Task(task_id)
);


CREATE TABLE Sended_Tasks (
    student_id UUID NOT NULL,
    task_id UUID NOT NULL,
    lesson_id UUID NOT NULL,
    status status_code NOT NULL DEFAULT 'not_sent',
    score INT NOT NULL,
    reviewer_id UUID,
    PRIMARY KEY (student_id, task_id, lesson_id),
    FOREIGN KEY (student_id) REFERENCES User_Course(user_id),
    FOREIGN KEY (task_id) REFERENCES Course_Lesson_Task(course_lesson_id),
    FOREIGN KEY (lesson_id) REFERENCES Course_Lesson(course_id),
    FOREIGN KEY (reviewer_id) REFERENCES User_Course(user_id)
);


CREATE TABLE TaskSubmissions (
    sended_task_id UUID NOT NULL,
    send_ts TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    content_link TEXT NOT NULL,
    FOREIGN KEY (sended_task_id) REFERENCES Sended_Tasks(task_id)
);
