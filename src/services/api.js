import axios from 'axios';

const API_URL = 'https://<your-azure-function-url>';

export const submitSurveyPage1 = async (formData) => {
  try {
    const response = await axios.post(`${API_URL}/submitSurveyPage1`, formData);
    return response.data;
  } catch (error) {
    console.error('Error submitting survey page 1:', error);
    throw error;
  }
};

export const submitSurveyPage2 = async (formData) => {
  try {
    const response = await axios.post(`${API_URL}/submitSurveyPage2`, formData);
    return response.data;
  } catch (error) {
    console.error('Error submitting survey page 2:', error);
    throw error;
  }
};

export const submitSurveyPage3 = async (formData) => {
  try {
    const response = await axios.post(`${API_URL}/submitSurveyPage3`, formData);
    return response.data;
  } catch (error) {
    console.error('Error submitting survey page 3:', error);
    throw error;
  }
};

export const submitSurveyPage4 = async (formData) => {
  try {
    const response = await axios.post(`${API_URL}/submitSurveyPage4`, formData);
    return response.data;
  } catch (error) {
    console.error('Error submitting survey page 4:', error);
    throw error;
  }
};

export const saveSurveyResponses = async (surveyData) => {
  try {
    const response = await axios.post(`${API_URL}/saveSurveyResponses`, surveyData);
    return response.data;
  } catch (error) {
    console.error('Error saving survey responses:', error);
    throw error;
  }
};
