INSERT INTO products (name, description, price, storeid, stock, img, category ) values('Poha', 'Agro Poha', 50.78, 1, 50, 'img/products/common/Agro_poha.png','1-1');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('cadbury dairy milk','cadbury-dairy-milk', 10.00, 1, 100,'img/products/common/cadbury-dairy-milk.png','1-1');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('corn flakes', 'kelloggs_corn_flakes', 22.81, 2, 40,'img/products/common/kelloggs_corn_flakes.png','1-2');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('fruit jam', 'kissan_mixed_fruit_jam', 78.00, 1, 30, 'img/products/common/kissan_mixed_fruit_jam.png','1-2');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('honey','patanjali-pure-honey', 50.00, 1, 10,'img/products/common/patanjali-pure-honey.png','1-2');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('oats-veggi-twist', 'saffola-masala-oats-veggi-twist', 122.50, 2, 5,'img/products/common/saffola-masala-oats-veggi-twist.png','1-2-1');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('eraser', 'eraser', 20.00, 1, 30, 'img/products/common/eraser.png','1-2-2');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('fevi kwik adhesive','fevi-kwik-adhesive', 10.00, 1, 10,'img/products/common/fevi-kwik-adhesive.png','1-2-3');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('marker', 'marker', 22.50, 1, 15,'img/products/common/marker.png','1-3-1');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('frooti-frooti-tetra-pack', 'frooti-frooti-tetra-pack', 20.00, 1, 30, 'img/products/common/frooti-frooti-tetra-pack.png','1-3-2');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('tropicana','tropicana', 10.00, 1, 10,'img/products/common/tropicana.png','1-3-3');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('real', 'real', 22.50, 1, 15,'img/products/common/real.png','1-3-3-1');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('minute_maid pulpy_orange', 'minute_maid pulpy_orange', 20.00, 1, 30, 'img/products/common/minute_maid_pulpy_orange.png','1-4');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('del monte green apple fruit drink','del-monte-green-apple-fruit-drink', 10.00, 1, 10,'img/products/common/del-monte-green-apple-fruit-drink.png','1-4-1');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('ceres peach juice', 'ceres-peach-juice', 22.50, 1, 15,'img/products/common/ceres-peach-juice.png','1-4-2');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('mogu mango juice', 'mogu-mango-juice', 20.00, 1, 30, 'img/products/common/mogu-mango-juice.png','1-4-3');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('gillette wilkinson sword blade','gillette-wilkinson-sword-blade', 10.00, 1, 10,'img/products/common/gillette-wilkinson-sword-blade.png','1-4-4');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('razors', 'razors', 22.50, 1, 15,'img/products/common/razors.png','1-5');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('palmolive moisturising deluxe shave cream', 'palmolive-moisturising-deluxe-shave-cream', 20.00, 1, 30, 'img/products/common/palmolive-moisturising-deluxe-shave-cream.png','1-5-1');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('axe','axe', 10.00, 1, 10,'img/products/common/axe.png','1-5-2');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('shaving foam', 'shaving_foam', 22.50, 1, 15,'img/products/common/shaving_foam.png','1-5-3');
INSERT INTO products (name, description, price, storeid, stock, img, category ) values('colgate max fresh blue gel', 'colgate-max-fresh-blue-gel', 22.50, 1, 15,'img/products/common/colgate-max-fresh-blue-gel.png','1-5-3-1');

INSERT INTO stores (name, description, address,email_id,location,image) values('store1','somestore','#1,1st Cross,XYZ layout,Commercial Road,ooty','vijay.danny@gmail.com','ooty','img/stores/store1.png');
INSERT INTO stores (name, description, address,email_id,location,image) values('store2','shopping mall','#1,1st Cross,XYZ layout,Commercial Road,bangalore','vijay.danny@gmail.com','Bangalore','img/stores/store2.png');
INSERT INTO stores (name, description, address,email_id,location,image) values('store3','somestore','#2,2st Cross,ABC layout,Commercial Road,ooty','vijay.danny@gmail.com','ooty','img/stores/store3.png');
INSERT INTO stores (name, description, address,email_id,location,image) values('store4','shopping mall','#1,2st Cross,XYZ layout,Commercial Road,bangalore','vijay.danny@gmail.com','Bangalore','img/stores/store4.png');

INSERT INTO locations (name) values('Bangalore');
INSERT INTO locations (name) values('Ooty');

INSERT INTO users (name,password,role_id,store_id) values('store1admin','store1admin','2','1');
INSERT INTO users (name,password,role_id,store_id) values('sa','sa','2','1');
INSERT INTO users (name,password,role_id,store_id) values('customer1','customer1','3','0');
INSERT INTO users (name,password,role_id,store_id) values('a','a','1','0');

insert into dues(store_id,amount_due,commission_percentage) values(1,0,2);
insert into dues(store_id,amount_due,commission_percentage) values(2,0,3);

INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/Agro_poha.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/axe.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/cadbury-dairy-milk.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/ceres-peach-juice.png');
INSERT INTO product_images (storeid, img ) values( 0, 'img/products/common/cherries.png');
INSERT INTO product_images (storeid, img ) values( 0, 'img/products/common/chicken.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/colgate-max-fresh-blue-gel.png');
INSERT INTO product_images (storeid, img ) values( 0, 'img/products/common/del_monte.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/del-monte-green-apple-fruit-drink.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/eraser.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/fevi-kwik-adhesive.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/frooti-frooti-tetra-pack.png');
INSERT INTO product_images (storeid, img ) values( 0, 'img/products/common/fun_food.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/gillette-wilkinson-sword-blade.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/kelloggs_corn_flakes.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/kissan_mixed_fruit_jam.png');
INSERT INTO product_images (storeid, img ) values( 0, 'img/products/common/knorr.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/marker.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/minute_maid_pulpy_orange.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/mogu-mango-juice.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/palmolive-moisturising-deluxe-shave-cream.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/patanjali-pure-honey.png');
INSERT INTO product_images (storeid, img ) values( 0, 'img/products/common/peanut_butter.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/razors.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/real.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/saffola-masala-oats-veggi-twist.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/shaving_foam.png');
INSERT INTO product_images (storeid, img ) values( 0, 'img/products/common/sweet_corn.png');
INSERT INTO product_images (storeid, img ) values( 1, 'img/products/common/tropicana.png');
INSERT INTO product_images (storeid, img ) values( 0, 'img/products/common/veg_soup.png');








