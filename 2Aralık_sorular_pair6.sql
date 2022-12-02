-- 1:Fiyatı 100 den fazla olan ve en az 1 sipariş verilmiş ürünleri stok adetine göre sıralanmış query?
   select name,unit_price,stock,count(*) from products as p
   inner join order_details as od
   on p.id = od.product_id
   group by name,stock,unit_price
   having unit_price > 100
   order by stock
  
   select * from baskets
   insert into baskets(total_price,product_id,customer_id)
   values (600.00,6,1),(358.00,7,1),(420.00,8,1),(690.00,10,1);
  
-- 2:Sepetinde o an en az 5 ürün olan customerları listeleyiniz.
   
   select count(*),name from customers as c
   inner join baskets as b on c.id = b.customer_id
   group by name
   having count(*) >= 5


-- 3: Bugüne kadar verdiği sipariş toplamı 500₺'yi geçen customerları listeleyiniz.
    select name,surname,od.order_total_price as  "sipariş toplamı" from customers as c
	inner join orders as o on c.id = o.customer_id
	inner join order_details as od on o.id = od.order_id
	where order_total_price >= 500


-- 4: Bugüne kadar en az 1000₺ satış yapmış satıcıları listeleyiniz.
   select sum(order_total_price),s.name from sellers as s
   inner join product_sellers as ps on s.id = ps.seller_id
   inner join products as p on ps.product_id = p.id
   inner join order_details as od on p.id = od.product_id
   group by s.name
   having sum(order_total_price) >= 1000


-- 5*: Her kategoride en çok kazandıran ürünü (price * quantity değeri ele alınmalıdır) listeleyiniz.
   select max(unit_price*stock),c.name from products as p
   inner join categories as c on p.category_id = c.id
   group by c.name


-- 6: Satıcıları sattığı ürün adedine göre büyükten küçüğe sıralayınız.
   select s.name "marka ismi",od.quantity "ürün adedi" from sellers as s
   inner join product_sellers as ps on s.id = ps.seller_id
   inner join products as p on ps.product_id = p.id
   inner join order_details as od on p.id = od.product_id
   order by od.quantity desc


-- 7.Siparişleri içerdiği ürün adedine göre listeleyiniz.
    select o.id "Sipariş Numarası", count(o.id) "Siparişteki Ürün Adedi" from order_details as od
    inner join orders as o on od.order_id = o.id
    group by o.id
	
-- 8:En çok kullanılan kargo şirketlerini kullanıldığı sipariş adedini listeleyiniz.
   select cc.name "kargo şirketleri",count(o.id) "alınan siparişler" from order_details as od
   inner join orders as o on od.order_id = o.id
   inner join cargo_companies as cc on o.cargo_company_id = cc.id
   group by cc.name
   
-- 9:Ürün bilgilerini içerisinde renk,satıcı bilgileri ile listeleyiniz.
    select p.name, c.name, s.name from colors as c
    inner join product_color as pc on c.id = pc.color_id
    inner join products as p on pc.product_id = p.id
    inner join product_sellers as ps on p.id = ps.product_id
    inner join sellers as s on ps.seller_id = s.id
   

-- 10: Girilen Ülke için kaç adet şehir olduğunu gösterelim.
      select co.name "ülke", count(*) "şehir" from cities as c
	  inner join countries as co on c.country_id = co.id
	  group by co.name


-- 11: Girilen şehir için kaç adet ilçe olduğunu,
      select c.name "şehir", count(*) "ilçe" from cities as c
	  inner join districts as d on c.id = d.city_id
	  group by c.name

-- 12: Girilen ilçe için kaç adet mahalle olduğunu listeleyiniz.
      select d.name "ilçe", count(*) "mahalle" from streets as s
	  inner join districts as d on s.district_id = d.id
	  group by d.name
   