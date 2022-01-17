create table users (
    id integer primary key generated always as identity,
    name text not null,
    avatar text,
    description text,
    birthday timestamptz,
    email text not null,
    password text not null
);

create table todos (
    id integer primary key generated always as identity,
    createdBy integer not null references users(id),
    deadline text not null
);

create table todo_items (
    id integer primary key generated always as identity,
    todo integer not null references todos(id),
    short_description text not null,
    long_description text,
    status smallint not null,
    public boolean not null
);