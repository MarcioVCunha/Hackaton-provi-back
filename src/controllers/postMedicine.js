import connection from "../database/database.js";

const postMedicine = async (req, res) => {
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

    await connection.query(`
      INSERT INTO
        medication (name, begin_date, dosage)
      VALUES
        ($1, $2, $3);
    `, [req.body.name, req.body.date, req.body.quantity]);

    const medicationId = await connection.query(`
      SELECT
        *
      FROM
        medication
      ORDER BY
        id
      DESC LIMIT 1;
    `);

    await connection.query(`
      INSERT INTO
        user_medication (user_id, medication_id)
      VALUES
        ($1, $2);      
    `, [id, medicationId.rows[0].id]);

    res.sendStatus(200);
  } catch (error) {
    console.log(error);
    res.sendStatus(500);
    return;
  }
};

export default postMedicine;