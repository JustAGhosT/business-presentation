import { SUBMIT_SURVEY_PAGE1, SUBMIT_SURVEY_PAGE2, SUBMIT_SURVEY_PAGE3, SUBMIT_SURVEY_PAGE4, SAVE_SURVEY_RESPONSES } from './actionTypes';

const initialState = {
  surveyPage1: {},
  surveyPage2: {},
  surveyPage3: {},
  surveyPage4: {},
  surveyResponses: {},
};

const surveyReducer = (state = initialState, action) => {
  switch (action.type) {
    case SUBMIT_SURVEY_PAGE1:
      return {
        ...state,
        surveyPage1: action.payload,
      };
    case SUBMIT_SURVEY_PAGE2:
      return {
        ...state,
        surveyPage2: action.payload,
      };
    case SUBMIT_SURVEY_PAGE3:
      return {
        ...state,
        surveyPage3: action.payload,
      };
    case SUBMIT_SURVEY_PAGE4:
      return {
        ...state,
        surveyPage4: action.payload,
      };
    case SAVE_SURVEY_RESPONSES:
      return {
        ...state,
        surveyResponses: action.payload,
      };
    default:
      return state;
  }
};

export default surveyReducer;
