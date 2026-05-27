--Agregar claves primarias a las tablas
alter table dim_customer add constraint pk_dim_customer primary key ("ID_Customer");
alter table dim_product add constraint pk_dim_product primary key ("ID_Product");
alter table dim_ubication add constraint pk_dim_ubication primary key ("ID_Ubication");
alter table dim_date add constraint pk_dim_date primary key ("ID_Date");
alter table fact_sales add constraint pk_fact_sales primary key ("ID_Sale");
--Agregar claves foráneas a la tabla de hechos
alter table fact_sales add constraint fk_fact_sales_dim_customer foreign key ("ID_Customer") references dim_customer("ID_Customer");
alter table fact_sales add constraint fk_fact_sales_dim_product foreign key ("ID_Product") references dim_product("ID_Product");
alter table fact_sales add constraint fk_fact_sales_dim_ubication foreign key ("ID_Ubication") references dim_ubication("ID_Ubication");
alter table fact_sales add constraint fk_fact_sales_dim_date foreign key ("ID_Date") references dim_date("ID_Date");
