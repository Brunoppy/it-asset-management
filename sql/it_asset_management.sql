CREATE DATABASE IT_Asset_Management;
USE IT_Asset_Management;

-- Table for storing asset categories (e.g., Hardware, Software, License)
CREATE TABLE asset_categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- Table for managing IT assets
CREATE TABLE it_assets (
    asset_id INT AUTO_INCREMENT PRIMARY KEY,
    asset_name VARCHAR(255) NOT NULL,
    category_id INT,
    serial_number VARCHAR(100) UNIQUE,
    purchase_date DATE,
    warranty_expiration DATE,
    assigned_to INT NULL,
    status ENUM('Active', 'In Maintenance', 'Retired') NOT NULL DEFAULT 'Active',
    FOREIGN KEY (category_id) REFERENCES asset_categories(category_id),
    FOREIGN KEY (assigned_to) REFERENCES employees(employee_id)
);

-- Table for tracking software licenses
CREATE TABLE software_licenses (
    license_id INT AUTO_INCREMENT PRIMARY KEY,
    software_name VARCHAR(255) NOT NULL,
    license_key VARCHAR(255) UNIQUE NOT NULL,
    expiration_date DATE,
    assigned_to INT NULL,
    FOREIGN KEY (assigned_to) REFERENCES employees(employee_id)
);

-- Table for asset maintenance records
CREATE TABLE asset_maintenance (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    asset_id INT NOT NULL,
    maintenance_date DATE NOT NULL,
    maintenance_details TEXT,
    technician_name VARCHAR(255),
    FOREIGN KEY (asset_id) REFERENCES it_assets(asset_id)
);
