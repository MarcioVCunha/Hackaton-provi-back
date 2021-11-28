import connection from "../database/database.js";

const getHints = async (req, res) => {
  try {
    const hints = await connection.query(`
      SELECT
        *
      FROM
        preventions
    `);

    res.status(200).send(hints.rows);
    return;
  } catch (error) {
    console.log(error);
    res.sendStatus(500);
    return;
  }

};

export default getHints;