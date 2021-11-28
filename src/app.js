import cors from 'cors';
import express from 'express';
import patientSignup from './controllers/patientSignUp.js';
import medicSignUp from './controllers/medicSignUp.js';
import signin from './controllers/signin.js';

const app = express();

app.use(cors());
app.use(express.json());

app.post('/signup-patient', patientSignup);
app.post('/signup-medic', medicSignUp);
app.post('/sign-in', signin);

export default app;