sql
-- Таблица пользователей
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    registration_date DATE,
    city TEXT
);

-- Таблица поездок
CREATE TABLE rides (
    ride_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    driver_id INT,
    ride_date TIMESTAMP,
    distance_km DECIMAL,
    fare_amount DECIMAL,
    status TEXT -- 'completed', 'cancelled'
)
