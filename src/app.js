import cors from 'cors';
import express from 'express';
import patientSignup from './controllers/patientSignUp.js';
import medicSignUp from './controllers/medicSignUp.js';

const app = express();

app.use(cors());
app.use(express.json());

app.post('/signup-patient', patientSignup);
app.post('/signup-medic', medicSignUp);

export default app;