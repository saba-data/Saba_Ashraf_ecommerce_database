CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,

    full_name VARCHAR(150) NOT NULL,

    email VARCHAR(255) NOT NULL UNIQUE,

    phone VARCHAR(20),

    hash_password TEXT,

    role VARCHAR(20)
        DEFAULT 'customer'
        CHECK (role IN ('customer','admin')),

    is_active BOOLEAN DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE categories (

    id BIGSERIAL PRIMARY KEY,

    name VARCHAR(100) NOT NULL UNIQUE,

    description TEXT,

    is_active BOOLEAN DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE products (

    id BIGSERIAL PRIMARY KEY,

    category_id BIGINT NOT NULL,

    name VARCHAR(200) NOT NULL,

    description TEXT,

    price NUMERIC(10,2)
        NOT NULL
        CHECK (price > 0),

    quantity_stock INTEGER
        DEFAULT 0
        CHECK (quantity_stock >= 0),

    sku VARCHAR(50) UNIQUE,

    is_active BOOLEAN DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES categories(id)
        ON DELETE RESTRICT
);
CREATE TABLE orders (

    id BIGSERIAL PRIMARY KEY,

    user_id BIGINT NOT NULL,

    status VARCHAR(30)
        DEFAULT 'pending'
        CHECK (
            status IN (
                'pending',
                'confirmed',
                'processing',
                'shipped',
                'delivered',
                'cancelled'
            )
        ),

    total_amount NUMERIC(12,2)
        DEFAULT 0
        CHECK (total_amount >= 0),

    shipping_address TEXT NOT NULL,

    notes TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON DELETE RESTRICT
);

CREATE TABLE order_items (

    id BIGSERIAL PRIMARY KEY,

    order_id BIGINT NOT NULL,

    product_id BIGINT NOT NULL,

    quantity INTEGER
        NOT NULL
        CHECK(quantity > 0),

    price_unit NUMERIC(10,2)
        NOT NULL
        CHECK(price_unit > 0),

    subtotal NUMERIC(12,2)
        NOT NULL,

    CONSTRAINT fk_order
        FOREIGN KEY(order_id)
        REFERENCES orders(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_product
        FOREIGN KEY(product_id)
        REFERENCES products(id)
        ON DELETE RESTRICT,

    CONSTRAINT unique_order_product
        UNIQUE(order_id,product_id),

    CONSTRAINT check_subtotal
        CHECK(subtotal = quantity * price_unit)
);

CREATE TABLE payments (

    id BIGSERIAL PRIMARY KEY,

    order_id BIGINT UNIQUE NOT NULL,

    payment_method VARCHAR(30)
        CHECK(
            payment_method IN (
                'cash',
                'card',
                'bank_transfer',
                'wallet'
            )
        ),

    payment_status VARCHAR(30)
        CHECK(
            payment_status IN (
                'pending',
                'paid',
                'failed',
                'refunded'
            )
        ),

    amount NUMERIC(12,2)
        CHECK(amount > 0),

    transaction_reference VARCHAR(100) UNIQUE,

    paid_at TIMESTAMP,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_payment_order
        FOREIGN KEY(order_id)
        REFERENCES orders(id)
        ON DELETE CASCADE
);