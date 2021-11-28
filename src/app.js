import cors from 'cors';
import express from 'express';
import { auth } from './middlewares/auth.js';
import patientSignup from './controllers/patientSignUp.js';
import medicSignUp from './controllers/medicSignUp.js';
import signin from './controllers/signin.js';
import getUsername from './controllers/getUsername.js';
import getHints from './controllers/getHints.js';
import postMedicInfo from './controllers/postMedicInfo.js';
import getMedics from './controllers/getMedics.js';

const app = express();

app.use(cors());
app.use(express.json());

app.post('/signup-patient', patientSignup);
app.post('/signup-medic', medicSignUp);
app.post('/sign-in', signin);
app.post('/medic-info', postMedicInfo);

app.get('/get-username', auth, getUsername);
app.get('/get-hints', auth, getHints);
app.get('/get-medics', getMedics);

export default app;