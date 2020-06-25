const express = require('express')

const router = express.Router()
const connexion = require('../conf')

let today = new Date().toISOString().slice(0, 10)

router.get('/:id', (req, res) => {
  let request = 'SELECT m.id, m.med_name , m.order_name , m.date, m.dosage, m.used, m.morning, m.midday, m.evening, m.night'
  request += ', d.firstname, d.lastname, d.specialty'
  request += ' FROM medication m'
  request += ' JOIN medication_doctor md ON md.doctor_id = m.doctor_id'
  request += ' JOIN doctor d ON md.doctor_id = d.id'
  request += ` WHERE m.patient_id = ? AND m.date >= ${today}`
  request += ' GROUP BY m.med_name, m.order_name, m.date, m.dosage, m.used, m.morning, m.midday, m.evening, m.night, d.firstname, d.lastname, d.specialty'
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

router.get('/:id/filter/date/', (req, res) => {
  let filterDate = new Date(req.body.filterDate)
  filterDate = filterDate.toLocaleDateString('fr-FR')

  let request = 'SELECT m.med_name , m.order_name , m.date, m.dosage, m.used, m.morning, m.midday, m.evening, m.night'
  request += ', d.firstname, d.lastname, d.specialty'
  request += ' FROM medication m'
  request += ' JOIN medication_doctor md ON md.doctor_id = m.doctor_id'
  request += ' JOIN doctor d ON md.doctor_id = d.id'
  request += ` WHERE m.patient_id = ? AND m.date <= CAST('${filterDate}' AS DATE)`
  request += ' GROUP BY m.med_name, m.order_name, m.date, m.dosage, m.used, m.morning, m.midday, m.evening, m.night, d.firstname, d.lastname, d.specialty'
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

router.get('/:id/filter/doctor/:doctor_id', (req, res) => {
  const { id, doctor_id } = req.params
  let request = 'SELECT m.med_name , m.order_name , m.date, m.dosage, m.used, m.morning, m.midday, m.evening, m.night'
  request += ', d.firstname, d.lastname, d.specialty'
  request += ' FROM medication m'
  request += ' JOIN medication_doctor md ON md.doctor_id = m.doctor_id'
  request += ' JOIN doctor d ON md.doctor_id = d.id'
  request += ` WHERE m.patient_id = ? AND m.doctor_id = ?`
  request += ' GROUP BY m.med_name, m.order_name, m.date, m.dosage, m.used, m.morning, m.midday, m.evening, m.night, d.firstname, d.lastname, d.specialty'
  connexion.query(request, [id, doctor_id], (err, result) => {
    if (err) {
      return res.status(500).json({
        message: err.message,
        sql: err.sql
      })
    }
    return res.status(200).json(result)
  })
})

router.get('/:id/filter/specialty/:type', (req, res) => {
  const { id, type } = req.params
  let request = 'SELECT m.med_name , m.order_name , m.date, m.dosage, m.used, m.morning, m.midday, m.evening, m.night'
  request += ', d.firstname, d.lastname, d.specialty'
  request += ' FROM medication m'
  request += ' JOIN medication_doctor md ON md.doctor_id = m.doctor_id'
  request += ' JOIN doctor d ON md.doctor_id = d.id'
  request += ` WHERE m.patient_id = ? AND d.specialty = ?`
  request += ' GROUP BY m.med_name, m.order_name, m.date, m.dosage, m.used, m.morning, m.midday, m.evening, m.night, d.firstname, d.lastname, d.specialty'
  connexion.query(request, [id, type], (err, result) => {
    if (err) {
      return res.status(500).json({
        message: err.message,
        sql: err.sql
      })
    }
    return res.status(200).json(result)
  })
})

router.get('/:doctor_id/filter/specialty/:type', (req, res) => {
  const { id, type } = req.params
  let request = 'SELECT m.med_name , m.order_name , m.date, m.dosage, m.used, m.morning, m.midday, m.evening, m.night'
  request += ', d.firstname, d.lastname, d.specialty'
  request += ' FROM medication m'
  request += ' JOIN medication_doctor md ON md.doctor_id = m.doctor_id'
  request += ' JOIN doctor d ON md.doctor_id = d.id'
  request += ` WHERE m.patient_id = ? AND d.specialty = ?`
  request += ' GROUP BY m.med_name, m.order_name, m.date, m.dosage, m.used, m.morning, m.midday, m.evening, m.night, d.firstname, d.lastname, d.specialty'
  connexion.query(request, [id, type], (err, result) => {
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