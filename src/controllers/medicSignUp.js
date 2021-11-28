import bcrypt from 'bcrypt';
import connection from '../database/database.js';

const medicSignUp = async (req, res) => {
  const { name, email, CRM, phone } = req.body;
  const password = bcrypt.hashSync(req.body.password, 10);

  try {
    const isEmailAvaible = await connection.query(`
      SELECT
        *
      FROM
        users
      WHERE
        email = $1;
    `, [email]);

    if(isEmailAvaible.rowCount !== 0){
      res.sendStatus(409);
      return;
    }

    await connection.query(`
      INSERT INTO
        users (name, type, email, password, phone, "CRM")
      VALUES
        ($1, 2, $2, $3, $4, $5);
    `, [name, email, password, phone, CRM]);
    res.sendStatus(200);
    return;
  } catch (error) {
    console.log(error);
    res.sendStatus(500);
    return
  }
};

export default medicSignUp;