import connection from "../database/database.js";

const postHistory = async (req, res) => {
  try {
    const token = req.body.token;

    const idAux = await connection.query(`
      SELECT
        *
      FROM
        sessions
      WHERE
        token = $1;
    `, [token]);

    const id = idAux.rows[0].user_id;

    const isThereHistory = await connection.query(`
      SELECT
        *
      FROM
        history
      JOIN
        patient_history
      ON
        patient_history.history_id = history.id
      WHERE
        patient_history.patient_id = $1;
    `, [id]);

    if (isThereHistory.rowCount === 0) {
      await connection.query(`
        INSERT INTO
          history (birth_date, blood_type, height, weight, sex)
        VALUES
          ($1, $2, $3, $4, $5);
      `, [req.body.birthday, req.body.bloodType, req.body.height, req.body.weight, req.body.sex]);

      const historyId = await connection.query(`
        SELECT
          id
        FROM
          history
        ORDER BY
          id
        DESC LIMIT 1;
      `);

      await connection.query(`
        INSERT INTO
          patient_history (patient_id, history_id)
        VALUES
          ($1, $2);
      `, [id, historyId.rows[0].id]);
    } else {
      await connection.query(`
        UPDATE
          history
        SET
          (birth_date, blood_type, height, weight, sex) = ($1, $2, $3, $4, $5)
        WHERE
          id = $6;
      `, [req.body.birthday, req.body.bloodType, req.body.height, req.body.weight, req.body.sex, isThereHistory.rows[0].id]);
    }

    await connection.query(`
      UPDATE
        users
      SET
        name = $1
      WHERE
        id = $2;
    `, [req.body.name, id]);

    res.sendStatus(200);
    return;
  } catch (error) {
    res.sendStatus(500)
    console.log(error);
    return;
  }
};

export default postHistory;