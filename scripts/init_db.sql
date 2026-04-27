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
);

-- =========================================
-- ТЕСТОВЫЕ ДАННЫЕ (СИНТЕТИЧЕСКИЕ)
-- =========================================
[27.04.2026 18:59] Полина: INSERT INTO users (registration_date, city) VALUES
('2024-01-05', 'Moscow'),
('2024-01-07', 'Moscow'),
('2024-01-10', 'SPB'),
('2024-01-12', 'Kazan'),
('2024-01-15', 'Moscow'),
('2024-01-20', 'SPB'),
('2024-02-01', 'Moscow'),
('2024-02-03', 'Kazan'),
('2024-02-10', 'SPB'),
('2024-02-15', 'Moscow');
[27.04.2026 18:59] Полина: INSERT INTO rides (user_id, driver_id, ride_date, distance_km, fare_amount, status) VALUES
-- Январь
(1, 101, '2024-01-06 10:00', 5.2, 320, 'completed'),
(1, 102, '2024-01-15 14:00', 3.1, 210, 'completed'),
(2, 103, '2024-01-08 09:30', 10.5, 540, 'cancelled'),
(2, 101, '2024-01-18 18:20', 7.0, 400, 'completed'),
(3, 104, '2024-01-11 12:00', 2.5, 150, 'completed'),
(4, 105, '2024-01-13 20:00', 12.0, 650, 'completed'),
(5, 101, '2024-01-16 08:00', 6.3, 370, 'completed'),
(6, 102, '2024-01-22 19:00', 8.4, 480, 'cancelled'),

-- Февраль
(1, 101, '2024-02-05 11:00', 4.0, 250, 'completed'),
(2, 103, '2024-02-07 15:00', 9.0, 500, 'completed'),
(3, 104, '2024-02-10 13:00', 3.5, 200, 'completed'),
(4, 105, '2024-02-14 21:00', 11.0, 620, 'cancelled'),
(7, 106, '2024-02-02 10:00', 5.0, 300, 'completed'),
(8, 107, '2024-02-04 17:00', 7.5, 420, 'completed'),
(9, 108, '2024-02-12 09:00', 6.0, 350, 'completed'),
(10, 109, '2024-02-16 22:00', 10.0, 580, 'completed'),

-- Март
(1, 101, '2024-03-03 10:00', 3.0, 180, 'completed'),
(2, 103, '2024-03-05 16:00', 8.0, 450, 'completed'),
(7, 106, '2024-03-07 12:00', 6.0, 340, 'completed'),
(8, 107, '2024-03-10 18:00', 7.2, 410, 'cancelled'),
(9, 108, '2024-03-15 09:00', 5.5, 320, 'completed'),
(10, 109, '2024-03-18 20:00', 9.5, 560, 'completed');


