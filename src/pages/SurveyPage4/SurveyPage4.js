import React, { useState } from 'react';

const SurveyPage4 = () => {
  const [formData, setFormData] = useState({
    municipalOutreachPackage: false,
    facilitiesManagerPresentation: false,
    siteAssessmentPackage: false,
    maintenanceProposalTemplate: false,
    tenderAlertSetup: false,
    basicTenderResponseKit: false,
    firstTenderAssistance: false,
    energyEfficiencyCampaign: false,
    complianceCampaign: false,
    maintenanceContractCampaign: false,
    tenderResponseCoaching: false,
    governmentNetworkingSupport: false,
    partnershipDevelopment: false,
    clientQuestions: {
      municipalOutreachPackage: '',
      facilitiesManagerPresentation: '',
      siteAssessmentPackage: '',
      maintenanceProposalTemplate: '',
      tenderAlertSetup: '',
      basicTenderResponseKit: '',
      firstTenderAssistance: '',
      energyEfficiencyCampaign: '',
      complianceCampaign: '',
      maintenanceContractCampaign: '',
      tenderResponseCoaching: '',
      governmentNetworkingSupport: '',
      partnershipDevelopment: '',
    },
  });

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    if (type === 'checkbox') {
      setFormData({
        ...formData,
        [name]: checked,
      });
    } else {
      setFormData({
        ...formData,
        clientQuestions: {
          ...formData.clientQuestions,
          [name]: value,
        },
      });
    }
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Add submit logic here
  };

  return (
    <form onSubmit={handleSubmit}>
      <h2>Phase 4: Public Sector Expansion</h2>

      <h3>Government Marketing</h3>
      <label>
        <input
          type="checkbox"
          name="municipalOutreachPackage"
          checked={formData.municipalOutreachPackage}
          onChange={handleChange}
        />
        Municipal Outreach Package
      </label>
      <div>
        <label>
          Which municipal departments would benefit most from your services?
          <input
            type="text"
            name="municipalOutreachPackage"
            value={formData.clientQuestions.municipalOutreachPackage}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="facilitiesManagerPresentation"
          checked={formData.facilitiesManagerPresentation}
          onChange={handleChange}
        />
        Facilities Manager Presentation
      </label>
      <div>
        <label>
          What key points would convince a facilities manager to use your services?
          <input
            type="text"
            name="facilitiesManagerPresentation"
            value={formData.clientQuestions.facilitiesManagerPresentation}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="siteAssessmentPackage"
          checked={formData.siteAssessmentPackage}
          onChange={handleChange}
        />
        Site Assessment Package
      </label>
      <div>
        <label>
          What would you look for during a site assessment?
          <input
            type="text"
            name="siteAssessmentPackage"
            value={formData.clientQuestions.siteAssessmentPackage}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="maintenanceProposalTemplate"
          checked={formData.maintenanceProposalTemplate}
          onChange={handleChange}
        />
        Maintenance Proposal Template
      </label>
      <div>
        <label>
          What maintenance packages could you offer government facilities?
          <input
            type="text"
            name="maintenanceProposalTemplate"
            value={formData.clientQuestions.maintenanceProposalTemplate}
            onChange={handleChange}
          />
        </label>
      </div>

      <h3>Tender Assistance</h3>
      <label>
        <input
          type="checkbox"
          name="tenderAlertSetup"
          checked={formData.tenderAlertSetup}
          onChange={handleChange}
        />
        Tender Alert Setup
      </label>
      <div>
        <label>
          What types of tenders are you most interested in?
          <input
            type="text"
            name="tenderAlertSetup"
            value={formData.clientQuestions.tenderAlertSetup}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="basicTenderResponseKit"
          checked={formData.basicTenderResponseKit}
          onChange={handleChange}
        />
        Basic Tender Response Kit
      </label>
      <div>
        <label>
          What are your key technical capabilities to highlight?
          <input
            type="text"
            name="basicTenderResponseKit"
            value={formData.clientQuestions.basicTenderResponseKit}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="firstTenderAssistance"
          checked={formData.firstTenderAssistance}
          onChange={handleChange}
        />
        First Tender Assistance
      </label>
      <div>
        <label>
          Have you identified a specific tender you'd like to respond to?
          <input
            type="text"
            name="firstTenderAssistance"
            value={formData.clientQuestions.firstTenderAssistance}
            onChange={handleChange}
          />
        </label>
      </div>

      <h3>Government-Specific Campaigns</h3>
      <label>
        <input
          type="checkbox"
          name="energyEfficiencyCampaign"
          checked={formData.energyEfficiencyCampaign}
          onChange={handleChange}
        />
        Energy Efficiency Campaign
      </label>
      <div>
        <label>
          What energy efficiency benefits can your services provide?
          <input
            type="text"
            name="energyEfficiencyCampaign"
            value={formData.clientQuestions.energyEfficiencyCampaign}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="complianceCampaign"
          checked={formData.complianceCampaign}
          onChange={handleChange}
        />
        Compliance Campaign
      </label>
      <div>
        <label>
          What regulations affect cooling systems in government buildings?
          <input
            type="text"
            name="complianceCampaign"
            value={formData.clientQuestions.complianceCampaign}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="maintenanceContractCampaign"
          checked={formData.maintenanceContractCampaign}
          onChange={handleChange}
        />
        Maintenance Contract Campaign
      </label>
      <div>
        <label>
          What maintenance contract options could you offer?
          <input
            type="text"
            name="maintenanceContractCampaign"
            value={formData.clientQuestions.maintenanceContractCampaign}
            onChange={handleChange}
          />
        </label>
      </div>

      <h3>Additional Marketing Support</h3>
      <label>
        <input
          type="checkbox"
          name="tenderResponseCoaching"
          checked={formData.tenderResponseCoaching}
          onChange={handleChange}
        />
        Tender Response Coaching
      </label>
      <div>
        <label>
          What aspects of tender responses do you find most challenging?
          <input
            type="text"
            name="tenderResponseCoaching"
            value={formData.clientQuestions.tenderResponseCoaching}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="governmentNetworkingSupport"
          checked={formData.governmentNetworkingSupport}
          onChange={handleChange}
        />
        Government Networking Support
      </label>
      <div>
        <label>
          Are you comfortable attending government networking events?
          <input
            type="text"
            name="governmentNetworkingSupport"
            value={formData.clientQuestions.governmentNetworkingSupport}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="partnershipDevelopment"
          checked={formData.partnershipDevelopment}
          onChange={handleChange}
        />
        Partnership Development
      </label>
      <div>
        <label>
          Are there services you don't offer that complement your work?
          <input
            type="text"
            name="partnershipDevelopment"
            value={formData.clientQuestions.partnershipDevelopment}
            onChange={handleChange}
          />
        </label>
      </div>

      <button type="submit">Submit</button>
    </form>
  );
};

export default SurveyPage4;
