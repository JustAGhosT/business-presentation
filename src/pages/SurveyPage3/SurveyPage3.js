import React, { useState } from 'react';

const SurveyPage3 = () => {
  const [formData, setFormData] = useState({
    basicTenderDocumentationPackage: false,
    complianceDocumentation: false,
    referencePortfolio: false,
    municipalServicesBrochure: false,
    technicalCapabilityStatement: false,
    maintenanceProgramOutline: false,
    municipalContactResearch: false,
    networkingPackage: false,
    supplierDatabaseRegistration: false,
    linkedInProfileOptimization: false,
    governmentFocusedWebsiteSection: false,
    clientQuestions: {
      basicTenderDocumentationPackage: '',
      complianceDocumentation: '',
      referencePortfolio: '',
      municipalServicesBrochure: '',
      technicalCapabilityStatement: '',
      maintenanceProgramOutline: '',
      municipalContactResearch: '',
      networkingPackage: '',
      supplierDatabaseRegistration: '',
      linkedInProfileOptimization: '',
      governmentFocusedWebsiteSection: '',
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
      <h2>Phase 3: Public Sector Preparation</h2>

      <h3>Business Documentation</h3>
      <label>
        <input
          type="checkbox"
          name="basicTenderDocumentationPackage"
          checked={formData.basicTenderDocumentationPackage}
          onChange={handleChange}
        />
        Basic Tender Documentation Package
      </label>
      <div>
        <label>
          Have you responded to any government tenders previously?
          <input
            type="text"
            name="basicTenderDocumentationPackage"
            value={formData.clientQuestions.basicTenderDocumentationPackage}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="complianceDocumentation"
          checked={formData.complianceDocumentation}
          onChange={handleChange}
        />
        Compliance Documentation
      </label>
      <div>
        <label>
          What industry certifications do you currently hold?
          <input
            type="text"
            name="complianceDocumentation"
            value={formData.clientQuestions.complianceDocumentation}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="referencePortfolio"
          checked={formData.referencePortfolio}
          onChange={handleChange}
        />
        Reference Portfolio
      </label>
      <div>
        <label>
          Do you have clients who could provide references?
          <input
            type="text"
            name="referencePortfolio"
            value={formData.clientQuestions.referencePortfolio}
            onChange={handleChange}
          />
        </label>
      </div>

      <h3>Government Marketing Materials</h3>
      <label>
        <input
          type="checkbox"
          name="municipalServicesBrochure"
          checked={formData.municipalServicesBrochure}
          onChange={handleChange}
        />
        Municipal Services Brochure
      </label>
      <div>
        <label>
          What services are most relevant to government facilities?
          <input
            type="text"
            name="municipalServicesBrochure"
            value={formData.clientQuestions.municipalServicesBrochure}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="technicalCapabilityStatement"
          checked={formData.technicalCapabilityStatement}
          onChange={handleChange}
        />
        Technical Capability Statement
      </label>
      <div>
        <label>
          What are the technical specifications of your equipment?
          <input
            type="text"
            name="technicalCapabilityStatement"
            value={formData.clientQuestions.technicalCapabilityStatement}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="maintenanceProgramOutline"
          checked={formData.maintenanceProgramOutline}
          onChange={handleChange}
        />
        Maintenance Program Outline
      </label>
      <div>
        <label>
          What preventative maintenance services do you offer?
          <input
            type="text"
            name="maintenanceProgramOutline"
            value={formData.clientQuestions.maintenanceProgramOutline}
            onChange={handleChange}
          />
        </label>
      </div>

      <h3>Relationship Building</h3>
      <label>
        <input
          type="checkbox"
          name="municipalContactResearch"
          checked={formData.municipalContactResearch}
          onChange={handleChange}
        />
        Municipal Contact Research
      </label>
      <div>
        <label>
          Do you have any existing contacts in municipal departments?
          <input
            type="text"
            name="municipalContactResearch"
            value={formData.clientQuestions.municipalContactResearch}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="networkingPackage"
          checked={formData.networkingPackage}
          onChange={handleChange}
        />
        Networking Package
      </label>
      <div>
        <label>
          Are you comfortable with networking events?
          <input
            type="text"
            name="networkingPackage"
            value={formData.clientQuestions.networkingPackage}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="supplierDatabaseRegistration"
          checked={formData.supplierDatabaseRegistration}
          onChange={handleChange}
        />
        Supplier Database Registration
      </label>
      <div>
        <label>
          Are you registered on any government supplier databases?
          <input
            type="text"
            name="supplierDatabaseRegistration"
            value={formData.clientQuestions.supplierDatabaseRegistration}
            onChange={handleChange}
          />
        </label>
      </div>

      <h3>Digital Presence Enhancement</h3>
      <label>
        <input
          type="checkbox"
          name="linkedInProfileOptimization"
          checked={formData.linkedInProfileOptimization}
          onChange={handleChange}
        />
        LinkedIn Profile Optimization
      </label>
      <div>
        <label>
          Do you have a LinkedIn profile currently?
          <input
            type="text"
            name="linkedInProfileOptimization"
            value={formData.clientQuestions.linkedInProfileOptimization}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="governmentFocusedWebsiteSection"
          checked={formData.governmentFocusedWebsiteSection}
          onChange={handleChange}
        />
        Government-Focused Website Section
      </label>
      <div>
        <label>
          What government-specific services should we highlight?
          <input
            type="text"
            name="governmentFocusedWebsiteSection"
            value={formData.clientQuestions.governmentFocusedWebsiteSection}
            onChange={handleChange}
          />
        </label>
      </div>

      <button type="submit">Submit</button>
    </form>
  );
};

export default SurveyPage3;
