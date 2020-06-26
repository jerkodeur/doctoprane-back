const express = require('express')

const router = express.Router()
const connexion = require('../conf')
const { query } = require('express')

let today = new Date().toISOString().slice(0, 10)

// Create a new medication
router.post('/', (req, res) => {
  connexion.query('INSERT INTO medication SET ?', req.body, (err, result) => {
    if (err) {
      return res.status(500).json({
        message: err.message,
        sql: err.sql
      })
    }
    const medDoctorId = {
      doctor_id: req.body.doctor_id,
      medication_id: result.insertId
    }
    connexion.query('INSERT INTO medication_doctor SET ?', medDoctorId, (err2, result2) => {
      if (err2) {
        return res.status(500).json({
          message: err2.message,
          sql: err2.sql
        })
      }
      const medPatientId = {
        patient_id: req.body.patient_id,
        medication_id: result.insertId
      }
      connexion.query('INSERT INTO medication_patient SET ?', medPatientId, (err3, result3) => {
        if (err3) {
          return res.status(500).json({
            message: err3.message,
            sql: err3.sql
          })
        }
        return res.status(201).json(result)
      })
    })
  })
})

//
router.put('/:patient_id/order/:order', (req, res) => {
  const { patient_id, order } = req.params
  connexion.query(`UPDATE medication SET used = !used, last_update = NOW()  WHERE patient_id = ? AND order_name = ?`, [patient_id, order], (err, result) => {
    if (err) {
      return res.status(500).json({
        message: err.message,
        sql: err.sql
      })
    }
    return res.status(200).json(result)
  })
})
module.exports = router