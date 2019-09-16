# drop database if exists gpporgs;
create database gpporgs;

use gpporgs;

create table users (
    calNetId varchar(255) not null primary key,
    firstName varchar(255) not null,
    lastName varchar(255),
    isAdmin boolean not null
);

create table organizations (
	id int not null primary key auto_increment,
    name varchar(255) not null,
    description longtext,
    addressId int not null,
    phone varchar(255),
    email varchar(255),
    website varchar(255),
    affiliations longtext not null,
    type varchar(255) not null,
    region varchar(255),
    sectors longtext,
    approved boolean not null
);

create table reviews (
	id int not null primary key auto_increment,
    organizationId int not null,
    addressId int not null,
    region varchar(255) not null,
    languages longtext not null,
    difficulties longtext,
    sectors longtext,
    stipend int,
    cost int,
    duration varchar(255),
    workDone longtext not null,
    typicalDay longtext,
    evaluation longtext not null,
    other longtext,
    safety int,
    responsiveness int,
    anonymous boolean
);

create table addresses (
	id int not null primary key auto_increment,
    street varchar(255),
    city varchar(255),
    state varchar(255),
    zip varchar(255),
    country varchar(255)
);

create table contacts (
	id int not null primary key auto_increment,
    organizationId int not null,
    name varchar(255),
    role varchar(255),
    email varchar(255),
    phone varchar(255)
);

