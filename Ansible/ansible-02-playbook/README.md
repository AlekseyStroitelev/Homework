<img src="https://bigdataschool.ru/wp-content/webp-express/webp-images/uploads/2020/06/%D0%BA%D0%BB%D0%B8%D0%BA_0-768x215.png.webp" height="64px"/>

## Installation Vector and Clichouse services

This ansible playbook supports the following:

- Install and configure Vector, a lightweight, fast tool for building observability pipelines
- Install Clichouse, fast Open-Source OLAP DBMS

## Installation

Installation will by made on two nodes:

- vector-01 with internal IPv4 10.131.0.32
- clichouse-01 with internal IPv4 10.131.0.27

## After installation

We have two configured nodes:

- vector-01 with default `vector.yml`
- clichouse-01 with created `database logs`