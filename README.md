<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, powerful, and provides tools required for large, robust applications.

## Learning Laravel

Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of all modern web application frameworks, making it a breeze to get started with the framework.

You may also try the [Laravel Bootcamp](https://bootcamp.laravel.com), where you will be guided through building a modern Laravel application from scratch.

If you don't feel like reading, [Laracasts](https://laracasts.com) can help. Laracasts contains over 2000 video tutorials on a range of topics including Laravel, modern PHP, unit testing, and JavaScript. Boost your skills by digging into our comprehensive video library.

## Laravel Sponsors

We would like to extend our thanks to the following sponsors for funding Laravel development. If you are interested in becoming a sponsor, please visit the Laravel [Patreon page](https://patreon.com/taylorotwell).

### Premium Partners

- **[Vehikl](https://vehikl.com/)**
- **[Tighten Co.](https://tighten.co)**
- **[Kirschbaum Development Group](https://kirschbaumdevelopment.com)**
- **[64 Robots](https://64robots.com)**
- **[Cubet Techno Labs](https://cubettech.com)**
- **[Cyber-Duck](https://cyber-duck.co.uk)**
- **[Many](https://www.many.co.uk)**
- **[Webdock, Fast VPS Hosting](https://www.webdock.io/en)**
- **[DevSquad](https://devsquad.com)**
- **[Curotec](https://www.curotec.com/services/technologies/laravel/)**
- **[OP.GG](https://op.gg)**
- **[WebReinvent](https://webreinvent.com/?utm_source=laravel&utm_medium=github&utm_campaign=patreon-sponsors)**
- **[Lendio](https://lendio.com)**

## Contributing

Thank you for considering contributing to the Laravel framework! The contribution guide can be found in the [Laravel documentation](https://laravel.com/docs/contributions).

## Code of Conduct

In order to ensure that the Laravel community is welcoming to all, please review and abide by the [Code of Conduct](https://laravel.com/docs/contributions#code-of-conduct).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell via [taylor@laravel.com](mailto:taylor@laravel.com). All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).

#
# Blog backend

### Import database from file.sql
    cat mysql_backup/laravel-202411062152.sql | vendor/bin/sail mysql

## db comands

    ./vendor/bin/sail artisan migrate
    ./vendor/bin/sail artisan migrate:fresh
    ./vendor/bin/sail artisan db:seed --class=ComponentsSeeder_v5
    ./vendor/bin/sail artisan migrate:refresh && ./vendor/bin/sail artisan db:seed --class=DatabaseSeeder

## clear chache when change .env
    ./vendor/bin/sail  artisan config:cache

## db queries

    select b.name from subcomponent a, component b where a.component_child_id = b.id;
    select b.name from subcomponent a, component b where a.component_parent_id = b.id;
    select * from subcomponent;

## conect mysql aws rds

    mysql -h database.c3aem6q8kqy0.eu-west-3.rds.amazonaws.com -P 3306 -u admin -p

## backup server to local (mysql aws rds)

    mysqldump -h database.c3aem6q8kqy0.eu-west-3.rds.amazonaws.com -P 3306 -u admin -p blog > backup_nombre_base_datos.sql

## laod data server to local (mysql aws rds)
    ./vendor/bin/sail  mysql
    use blog
    mysql> copy backup_nombre_base_datos.sql to mysql console

### Export database (pkg: revolution/sail-db-backup)
    vendor/bin/sail art sail:backup:mysql

    vendor/bin/sail composer require beyondcode/laravel-er-diagram-generator --dev
    vendor/bin/sail artisan vendor:publish --provider="BeyondCode\ErdGenerator\ErdGeneratorServiceProvider"
    vendor/bin/sail artisan generate:erd
    error 
    vendor/bin/sail root-shell 
    apt-get update && apt-get install -y graphviz
    vendor/bin/sail artisan generate:erd 

    
    ./vendor/bin/sail artisan db:seed --class=CategoriesSeeder


### Database queris

UPDATE component_type
SET name = 'button'
WHERE id = 15;


INSERT INTO component_attribute (created_at, updated_at, name, value, component_id)
VALUES (NOW(), NOW(), 'height', '30px', 8);

INSERT INTO component_attribute (created_at, updated_at, name, value, component_id)
VALUES (NOW(), NOW(), 'width', '100px', 8);

INSERT INTO component_attribute (created_at, updated_at, name, value, component_id)
VALUES (NOW(), NOW(), 'raise', '10px', 8);

INSERT INTO component_attribute (created_at, updated_at, name, value, component_id)
VALUES (NOW(), NOW(), 'rounded', '20px', 8);

INSERT INTO component_attribute (created_at, updated_at, name, value, component_id)
VALUES (NOW(), NOW(), 'border', '10px', 8);

INSERT INTO component_attribute (created_at, updated_at, name, value, component_id)
VALUES (NOW(), NOW(), 'border_style', '#FF4769', 8);

INSERT INTO component_attribute (created_at, updated_at, name, value, component_id)
VALUES (NOW(), NOW(), 'bg_front_color', '#FF1F48', 8);

INSERT INTO component_attribute (created_at, updated_at, name, value, component_id)
VALUES (NOW(), NOW(), 'bg_shadow_color', '#D9D9D9', 8);

INSERT INTO component_attribute (created_at, updated_at, name, value, component_id)
VALUES (NOW(), NOW(), 'bg_back_color', '#E00029', 8);


INSERT INTO component_attribute (created_at, updated_at, name, value, component_id)
VALUES (NOW(), NOW(), 'font_color', '#fff', 8);

INSERT INTO component_attribute (created_at, updated_at, name, value, component_id)
VALUES (NOW(), NOW(), 'font_body_weight', '400', 8);

INSERT INTO component_attribute (created_at, updated_at, name, value, component_id)
VALUES (NOW(), NOW(), 'font_size', '20px', 8);

INSERT INTO component_attribute (created_at, updated_at, name, value, component_id)
VALUES (NOW(), NOW(), 'ripple', 'true', 8);

INSERT INTO component_attribute (created_at, updated_at, name, value, component_id)
VALUES (NOW(), NOW(), 'list', 'item1,item2,item3', 32);

INSERT INTO component_attribute (created_at, updated_at, name, value, component_id)
VALUES (NOW(), NOW(), 'show_iframe', 'true', 10);

