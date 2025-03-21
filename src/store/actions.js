import axios from 'axios';
import { SUBMIT_SURVEY_PAGE1, SUBMIT_SURVEY_PAGE2, SUBMIT_SURVEY_PAGE3, SUBMIT_SURVEY_PAGE4, SAVE_SURVEY_RESPONSES } from './actionTypes';

const API_URL = 'https://<your-azure-function-url>';

export const submitSurveyPage1 = (formData) => async (dispatch) => {
  try {
    const response = await axios.post(`${API_URL}/submitSurveyPage1`, formData);
    dispatch({
      type: SUBMIT_SURVEY_PAGE1,
      payload: response.data,
    });
  } catch (error) {
    console.error('Error submitting survey page 1:', error);
    throw error;
  }
};

export const submitSurveyPage2 = (formData) => async (dispatch) => {
  try {
    const response = await axios.post(`${API_URL}/submitSurveyPage2`, formData);
    dispatch({
      type: SUBMIT_SURVEY_PAGE2,
      payload: response.data,
    });
  } catch (error) {
    console.error('Error submitting survey page 2:', error);
    throw error;
  }
};

export const submitSurveyPage3 = (formData) => async (dispatch) => {
  try {
    const response = await axios.post(`${API_URL}/submitSurveyPage3`, formData);
    dispatch({
      type: SUBMIT_SURVEY_PAGE3,
      payload: response.data,
    });
  } catch (error) {
    console.error('Error submitting survey page 3:', error);
    throw error;
  }
};

export const submitSurveyPage4 = (formData) => async (dispatch) => {
  try {
    const response = await axios.post(`${API_URL}/submitSurveyPage4`, formData);
    dispatch({
      type: SUBMIT_SURVEY_PAGE4,
      payload: response.data,
    });
  } catch (error) {
    console.error('Error submitting survey page 4:', error);
    throw error;
  }
};

export const saveSurveyResponses = (surveyData) => async (dispatch) => {
  try {
    const response = await axios.post(`${API_URL}/saveSurveyResponses`, surveyData);
    dispatch({
      type: SAVE_SURVEY_RESPONSES,
      payload: response.data,
    });
  } catch (error) {
    console.error('Error saving survey responses:', error);
    throw error;
  }
};
