-- Table structure for table `propierties`

DROP TABLE IF EXISTS `propierties`;

CREATE TABLE `propierties` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(32) NOT NULL,
    `price` decimal(10, 2) NOT NULL,
    `image` varchar(256) DEFAULT NULL,
    `description` longtext DEFAULT NULL,
    `rooms` int(11) DEFAULT NULL,
    `wc` int(11) DEFAULT NULL,
    `timestamp` date DEFAULT NULL,
    `id_seller` int(11) NOT NULL,
    `sold` tinyint(1) DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `id_seller` (`id_seller`),
    CONSTRAINT `propierties_ibfk_1` FOREIGN KEY (`id_seller`) REFERENCES `sellers` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 21 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- Dumping data for table `propierties`

LOCK TABLES `propierties` WRITE;

INSERT INTO
    `propierties`
VALUES (
        1,
        'Beachfront House',
        250000.00,
        'beach_house.jpg',
        'Beautiful house right on the beach, perfect for vacations.',
        3,
        2,
        '2024-10-01',
        1001,
        0
    ),
    (
        2,
        'Central Apartment',
        180000.00,
        'central_apartment.jpg',
        'Modern apartment with city views, close to everything.',
        2,
        1,
        '2024-10-05',
        1002,
        0
    ),
    (
        3,
        'Country Estate',
        300000.00,
        'country_estate.jpg',
        'Large estate with farmland and a cozy country house.',
        4,
        3,
        '2024-10-10',
        1001,
        0
    ),
    (
        4,
        'Industrial Loft',
        200000.00,
        'industrial_loft.jpg',
        'Trendy industrial-style loft with all amenities.',
        1,
        1,
        '2024-10-12',
        1002,
        0
    ),
    (
        9,
        'OAXACA',
        1000.00,
        '',
        'La mejor casa de oaxaca                ',
        2,
        1,
        '2024-10-31',
        1001,
        0
    ),
    (
        10,
        'foo',
        1235.00,
        '',
        'sadkjasd                    ',
        1,
        1,
        '2024-10-30',
        1004,
        0
    ),
    (
        13,
        'Example',
        990.00,
        '',
        'Lorem impsum                    ',
        1,
        1,
        '2024-11-08',
        1002,
        0
    ),
    (
        14,
        'PC23',
        9876.00,
        '',
        'Lorem impsum asd terws',
        6,
        2,
        '2024-11-08',
        1002,
        1
    ),
    (
        17,
        'REOP',
        3.30,
        '',
        '                    sadfh',
        1,
        1,
        '2024-11-04',
        1004,
        0
    ),
    (
        19,
        'POUTRIU',
        3.31,
        '',
        'LOREM IPSUM CARLO TUTEP COLEM NAMTI',
        1,
        1,
        '2024-11-04',
        1004,
        1
    ),
    (
        20,
        'UTT',
        99999.00,
        'Screenshot from 2024-10-30 18-24-00.png',
        'lorem impsum',
        80,
        12,
        '2024-10-31',
        1006,
        0
    );

UNLOCK TABLES;

-- Table structure for table `sales`

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
    `seller_id` int(11) NOT NULL,
    `property_id` int(11) NOT NULL,
    `sale_date` date NOT NULL,
    PRIMARY KEY (`seller_id`, `property_id`),
    KEY `property_id` (`property_id`),
    CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`),
    CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `propierties` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- Dumping data for table `sales`

LOCK TABLES `sales` WRITE;

INSERT INTO
    `sales`
VALUES (1001, 1, '2024-10-31'),
    (1001, 14, '2024-11-01'),
    (1001, 19, '2024-11-01');

UNLOCK TABLES;

-- Table structure for table `sellers`

DROP TABLE IF EXISTS `sellers`;

CREATE TABLE `sellers` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(32) NOT NULL,
    `email` varchar(32) NOT NULL,
    `phone` varchar(10) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2719 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- Dumping data for table `sellers`
LOCK TABLES `sellers` WRITE;

INSERT INTO
    `sellers`
VALUES (
        1001,
        'Foo Bar',
        'foo@bar.com',
        '1234567890'
    ),
    (
        1002,
        'Bar Foo',
        'bar@foo.com',
        '0987654321'
    ),
    (
        1004,
        'Pedro',
        'ola@mail,',
        '123456'
    ),
    (
        1006,
        'Pepe',
        'ppeep@utt',
        '0987654'
    );

UNLOCK TABLES;

-- Temporary table structure for view `vw_available_properties`

DROP TABLE IF EXISTS `vw_available_properties`;

SET @saved_cs_client = @@character_set_client;

SET character_set_client = utf8;

SET character_set_client = @saved_cs_client;