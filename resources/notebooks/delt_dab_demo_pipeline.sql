-- Databricks notebook source
--- create streaming table
create or replace streaming table st_orders as select * from stream(samples.tpch.orders)

-- COMMAND ----------

--- create materialized view
create or replace materialized view cnt_orders as select count(o_orderkey) as cnt,o_orderstatus from live.st_orders group by o_orderstatus