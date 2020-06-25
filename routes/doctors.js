const express = require('express')

const router = express.Router()
const connexion = require('../conf')

let today = new Date().toISOString().slice(0, 10)

router.get('/:id', (req, res) => {
  let request = 'SELECT p.id, p.firstname, p.lastname FROM patient p '
  request += 'JOIN medication m ON p.id = m.patient_id '
  request += 'WHERE m.doctor_id = ? '
  request += 'GROUP BY p.id'
  connexion.query(request, req.params.id, (err, result) => {
    if (err) {
      return res.status(500).json({
        message: err.message,
        sql: err.sql
      })
    }
    return res.status(200).json(result)
  })
})

router.get('/:id/patient/:patient_id', (req, res) => {
  const { id, patient_id } = req.params
  let request = 'SELECT m.med_name , m.order_name , m.date, m.dosage, m.used, m.morning, m.midday, m.evening, m.night, last_take'
  request += ', p.firstname, p.lastname'
  request += ' FROM medication m'
  request += ' JOIN medication_patient mp ON mp.patient_id = m.patient_id'
  request += ' JOIN patient p ON mp.patient_id = p.id'
  request += ` WHERE m.doctor_id = ? AND p.id = ? AND m.date >= ${today}`
  request += ' GROUP BY m.med_name, m.order_name, m.date, m.dosage, m.used, m.morning, m.midday, m.evening, m.night, p.firstname, p.lastname'
  connexion.query(request, [id, patient_id], (err, result) => {
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