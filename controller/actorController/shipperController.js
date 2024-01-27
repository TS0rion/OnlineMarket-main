// const express = require("express");
// const connection = require("../../database/connect");
// const sql = require("mssql");
// const Shipper = require("../../models/actor/Shipper");

const { Request, TYPES } = require("mssql");
const connect = require("../../database/connect");

var sql = require("mssql");
const config = require("../../database/config");

// connect to your database

const getAllShipper = async (req, res) => {
  var pool = await sql.connect(config);
  // console.log(pool);
  try {
    const result = await pool.request().query("SELECT * FROM Shipper");
    res.json(result.recordset);
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  } finally {
    pool.close();
  }
};

const getShipperById = async (req, res) => {
  const { id } = req.params;
  var pool = await sql.connect(config);
  try {
    const result = await pool
      .request()
      .input("id", TYPES.Int, id)
      .query("SELECT * FROM Shipper WHERE ShipperId = @id");
    if (result.recordset.length > 0) {
      res.json(result.recordset[0]);
    } else {
      res.status(404).send("Shipper not found");
    }
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  } finally {
    pool.close();
  }
};

const createShipper = async (req, res) => {
  const { ShipperId, Name, Phone, Email, Gender, Status, AreaId } = req.body;
  // console.log(Image);
  var pool = await sql.connect(config);

  try {
    await pool
      .request()
      .input("ShipperId", TYPES.Int, ShipperId)
      .input("Name", TYPES.NVarChar, Name)
      .input("Phone", TYPES.VarChar, Phone)
      .input("Email", TYPES.VarChar, Email)
      .input("Gender", TYPES.Int, Gender)
      .input("Status", TYPES.Char, Status)
      // .input("Image", TYPES.VarBinary, Image)
      .input("AreaId", TYPES.Int, AreaId).query(`
      INSERT INTO Shipper (ShipperId, Name, Phone, Email, Gender, Status,  AreaId )
      VALUES (@ShipperId, @Name, @Phone, @Email,  @Gender, @Status, @AreaId)
    `);
    res.status(201).send("Shipper created successfully");
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  } finally {
    pool.close();
  }
};

const updateShipperById = async (req, res) => {
  const { id } = req.params;
  const { ShipperId, Name, Phone, Email, Gender, Status, AreaId } = req.body;
  // console.log(Image);
  var pool = await sql.connect(config);
  console.log(id);
  try {
    const result = await pool
      .request()
      .input("id", TYPES.Int, id)
      .query("SELECT * FROM Shipper WHERE ShipperId = @id");
    console.log(id);
    if (result.recordset.length > 0) {
      await pool
        .request()
        .input("id", TYPES.Int, id)
        .input("ShipperId", TYPES.Int, ShipperId)
        .input("Name", TYPES.NVarChar, Name)
        .input("Phone", TYPES.VarChar, Phone)
        .input("Email", TYPES.VarChar, Email)
        .input("Gender", TYPES.Int, Gender)
        .input("Status", TYPES.Char, Status)
        // .input("Image", TYPES.VarBinary, Image)
        .input("AreaId", TYPES.Int, AreaId)
        .query(
          `UPDATE Shipper
      SET ShipperId = @ShipperId, Name = @Name, Phone = @Phone, Email = @Email, Gender = @Gender, Status = @Status , AreaId =@AreaId
      WHERE ShipperId = @id`
        );
      res.send("Shipper updated successfully");
    } else {
      res.status(404).send("Shipper not found");
    }
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  } finally {
    pool.close();
  }
};

module.exports = {
  getAllShipper,
  getShipperById,
  createShipper,
  updateShipperById,
};
