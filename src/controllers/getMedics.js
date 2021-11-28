import connection from "../database/database.js";

const getMedics = async (req, res) => {
  const stateName = [];
  const cityName = [];

  try {
    const medicInfo = await connection.query(`
      SELECT
        *
      FROM
        users
      WHERE
        type = 2
    `);

    const medicInfoTwo = await connection.query(`
      SELECT
        *
      FROM
        medic
    `);

    for (let i = 0; i < medicInfo.rows.length; i++) {
      const stateNameAux = await connection.query(`
        SELECT
          states.name
        FROM
          states
        JOIN
          medic_localization
        ON
          states.id = medic_localization.state_id
        WHERE
          medic_localization.medic_id = $1;
      `, [medicInfo.rows[i].id]);


      stateName.push(stateNameAux.rows[0]);
    }

    for (let i = 0; i < medicInfo.rows.length; i++) {
      const cityNameAux = await connection.query(`
        SELECT
          cities.name
        FROM
          cities
        JOIN
          medic_localization
        ON
          cities.id = medic_localization.city_id
        WHERE
          medic_localization.medic_id = $1;
      `, [medicInfo.rows[i].id]);


      cityName.push(cityNameAux.rows[0]);
    }

    const allMedics = [];

    for (let i = 0; i < medicInfo.rows.length; i++) {
      allMedics.push({
        name: medicInfo.rows[i].name,
        specialization: medicInfoTwo.rows[i].specialization,
        CRM: medicInfo.rows[i].CRM,
        phone: medicInfo.rows[i].phone,
        address: medicInfoTwo.rows[0].address,
        addressNumber: medicInfoTwo.rows[0].address_number,
        state: stateName[i].name,
        city: cityName[i].name
      })
    }

    res.status(200).send(allMedics);
    return;
  } catch (error) {
    res.sendStatus(500);
    console.log(error);
    return;
  }
};

export default getMedics;