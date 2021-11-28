import connection from "../database/database.js";

const getUserInfo = async (req, res) => {
  const token = req.body.token;

  try {
    const idAux = await connection.query(`
      SELECT
        *
      FROM
        sessions
      WHERE
        token = $1;
    `, [token]);

    const id = idAux.rows[0].user_id;

    const getUserInfo = await connection.query(`
      SELECT
        *
      FROM
        users
      WHERE
        id = $1;
    `, [id]);

    const getUserHistory = await connection.query(`
      SELECT
        history.birth_date, history.blood_type, history.weight, history.height, history.sex
      FROM
        history
      JOIN
        patient_history
      ON
        history.id = patient_history.patient_id
      WHERE
        patient_id = $1;
    `, [id]);

    const getUserMedication = await connection.query(`
      SELECT
        medication.name, medication.begin_date, medication.dosage
      FROM
        medication
      JOIN
        user_medication
      ON
        user_medication.medication_id = medication.id
      WHERE
        user_medication.user_id = $1;
    `, [id]);

    const returnInfo = {
      userInfo: (getUserInfo.rows),
      userHistory: (getUserHistory.rows),
      userMedications: (getUserMedication.rows)
    }

    res.status(200).send(returnInfo);
    return;
  } catch (error) {
    res.sendStatus(500);
    console.log(error);
    return;
  }
};

export default getUserInfo;