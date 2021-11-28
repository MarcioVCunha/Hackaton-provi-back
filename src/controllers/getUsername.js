import connection from "../database/database.js";

const getUsername = async (req, res) => {
  const id = req.userId;

  try {
    const username = await connection.query(`
      SELECT
        name
      FROM
        users
      WHERE
        id = $1;
    `, [id]);

    res.status(200).send(username.rows[0].name);
    return;
  } catch (error) {
    res.sendStatus(500);
    console.log(error);
    return;
  }
};

export default getUsername;