import connection from "../database/database.js";

const postMedicInfo = async (req, res) => {
  try {
    const id = await connection.query(`
      SELECT
        user_id
      FROM
        sessions
      WHERE
        token = $1;
    `, [req.body.token]);

    await connection.query(`
      UPDATE
        users
      SET
        (name, email, phone, "CRM") = ($1, $2, $3, $4)
      WHERE
        id = $5;
    `, [req.body.name, req.body.email, req.body.phone, req.body.CRM, id.rows[0].user_id]);

    const isThereRegistration = await connection.query(`
      SELECT
        *
      FROM
        medic
      WHERE
        user_id = $1;
    `, [id.rows[0].user_id]);

    if (isThereRegistration.rowCount === 0) {
      await connection.query(`
        INSERT INTO
          medic (user_id, specialization, address, address_number)
        VALUES
          ($1, $2, $3, $4);
      `, [id.rows[0].user_id, req.body.specialty, req.body.street, req.body.number]);
    } else {
      await connection.query(`
        UPDATE
          medic
        SET 
          (specialization, address, address_number) = ($2, $3, $4)
        WHERE
          user_id = $1;
      `, [id.rows[0].user_id, req.body.specialty, req.body.street, req.body.number]);
    }

    const isThereCity = await connection.query(`
      SELECT
        *
      FROM
        cities
      WHERE
        name = $1;
    `, [req.body.city]);

    if (isThereCity.rowCount === 0) {
      await connection.query(`
        INSERT INTO
          cities (name)
        VALUES
          ($1);
      `, [req.body.city]);
    }

    const cityId = await connection.query(`
      SELECT
        *
      FROM
        cities
      WHERE
        name = $1;
    `, [req.body.city]);

    const isThereState = await connection.query(`
      SELECT
        *
      FROM
        states
      WHERE
        name = $1;
    `, [req.body.state]);

    if (isThereState.rowCount === 0) {
      await connection.query(`
        INSERT INTO
          states (name)
        VALUES
          ($1);
      `, [req.body.state]);
    }

    const stateId = await connection.query(`
      SELECT
        *
      FROM
        states
      WHERE
        name = $1;
    `, [req.body.state]);

    const isThereMedicLocation = await connection.query(`
    SELECT
      *
    FROM
      medic_localization
    WHERE
      medic_id = $1;
  `, [id.rows[0].user_id]);

  if(isThereMedicLocation.rowCount === 0){
    await connection.query(`
      INSERT INTO
        medic_localization (medic_id, city_id, state_id)
      VALUES
        ($1, $2, $3)
    `, [id.rows[0].user_id, cityId.rows[0].id, stateId.rows[0].id]);
  } else {
    await connection.query(`
      UPDATE
        medic_localization
      SET
        (city_id, state_id) = ($2, $3)
      WHERE
        medic_id = $1;
    `, [id.rows[0].user_id, cityId.rows[0].id, stateId.rows[0].id]);
  }

    res.sendStatus(200);
  } catch (error) {
    console.log(error)
    res.sendStatus(500)
    return
  }
}

export default postMedicInfo;