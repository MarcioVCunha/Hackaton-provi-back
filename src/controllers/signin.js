import connection from "../database/database.js";
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';

const signin = async (req, res) => {
  const { email, password } = req.body;

  try {
    const isEmailOkay = await connection.query(`
      SELECT
        *
      FROM
        users
      WHERE
        email = $1;
    `, [email]);

    if (isEmailOkay.rowCount === 0) {
      res.sendStatus(404);
      return;
    }

    const isPasswordEqual = await bcrypt.compare(password, isEmailOkay.rows[0].password);

    if (!isPasswordEqual) {
      res.sendStatus(404);
      return;
    }

    const token = uuid();
    const type = isEmailOkay.rows[0].type;
    const id = isEmailOkay.rows[0].id;

    await connection.query(`
      DELETE FROM
        sessions
      WHERE
        user_id = $1;
    `, [id]);

    await connection.query(`
      INSERT INTO
        sessions  (user_id, token)
      VALUES
        ($1, $2);
    `, [id, token]);

    res.status(200).send({ token, type, id });
  } catch (error) {
    console.log(error);
    res.sendStatus(500);
    return;
  }
};

export default signin;