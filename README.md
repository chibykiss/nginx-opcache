# 🚀 Nginx OPCache for Laravel (with Docker)

This project demonstrates how to enable and configure **Nginx OPCache** in a **Laravel application** running inside **Docker**. It’s aimed at improving performance in production environments by caching compiled PHP code.

---

## 📦 Features

- Laravel application scaffold
- Nginx + PHP-FPM with OPCache enabled
- Dockerized environment for easy setup
- Customizable OPCache configuration
- Ideal for local development and production usage

---

## 📁 Project Structure

```
nginx-opcache/
├── app/                   # Laravel application
├── docker/
│   ├── nginx/
│   │   └── default.conf   # Nginx site configuration
│   ├── php/
│   │   └── opcache.ini    # Custom OPCache settings
│   └── Dockerfile         # PHP image with OPCache
├── docker-compose.yml
└── README.md
```

---

## ⚙️ OPCache Configuration

Located in `docker/php/opcache.ini`:

```ini
opcache.enable=1
opcache.memory_consumption=128
opcache.interned_strings_buffer=8
opcache.max_accelerated_files=10000
opcache.revalidate_freq=0
opcache.validate_timestamps=0
```

> These settings are optimized for production. Modify them as needed.

---

## 🐳 Getting Started with Docker

1. **Clone the repository:**

```bash
git clone https://github.com/your-username/nginx-opcache.git
cd nginx-opcache
```

2. **Start Docker containers:**

```bash
docker-compose up -d --build
```

3. **Access your Laravel app:**

Visit [http://localhost](http://localhost) in your browser.

---

## 🧪 Testing OPCache

You can add a `phpinfo()` route to check that OPCache is enabled:

```php
Route::get('/phpinfo', function () {
    phpinfo();
});
```

Look for the "Zend OPcache" section in the output.

---

## ✅ Requirements

- Docker
- Docker Compose

---

## 🧰 Customization

- Update the `opcache.ini` file to tweak caching behavior.
- Modify Nginx config in `docker/nginx/default.conf` as needed.

---

## 🙌 Credits

Created by [Your Name](https://github.com/your-username)

---

## 📝 License

This project is open-sourced under the [MIT license](LICENSE).