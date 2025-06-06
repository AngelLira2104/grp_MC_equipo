import { Sequelize } from 'sequelize';

const sequelize = new Sequelize(`postgres://postgres:admin1234@40.0.0.70:5432/contable`, {
    dialect: 'postgres',
});

export default sequelize;
