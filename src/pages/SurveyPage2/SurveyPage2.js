import React, { useState } from 'react';

const SurveyPage2 = () => {
  const [formData, setFormData] = useState({
    targetedServiceFlyers: false,
    projectShowcase: false,
    serviceGuaranteeCertificate: false,
    promotionalItems: false,
    websiteEnhancement: false,
    localSEOPackage: false,
    contentCreation: false,
    lodgeHospitalityCampaign: false,
    businessCommercialCampaign: false,
    agriculturalFarmCampaign: false,
    vehicleEnhancement: false,
    localPrintAdvertising: false,
    communitySignage: false,
    referralProgram: false,
    clientQuestions: {
      targetedServiceFlyers: '',
      projectShowcase: '',
      serviceGuaranteeCertificate: '',
      promotionalItems: '',
      websiteEnhancement: '',
      localSEOPackage: '',
      contentCreation: '',
      lodgeHospitalityCampaign: '',
      businessCommercialCampaign: '',
      agriculturalFarmCampaign: '',
      vehicleEnhancement: '',
      localPrintAdvertising: '',
      communitySignage: '',
      referralProgram: '',
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
      <h2>Phase 2: Private Sector Penetration</h2>

      <h3>Enhanced Marketing Materials</h3>
      <label>
        <input
          type="checkbox"
          name="targetedServiceFlyers"
          checked={formData.targetedServiceFlyers}
          onChange={handleChange}
        />
        Targeted Service Flyers
      </label>
      <div>
        <label>
          What specific services do you offer for each sector?
          <input
            type="text"
            name="targetedServiceFlyers"
            value={formData.clientQuestions.targetedServiceFlyers}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="projectShowcase"
          checked={formData.projectShowcase}
          onChange={handleChange}
        />
        Project Showcase
      </label>
      <div>
        <label>
          Which projects are you most proud of?
          <input
            type="text"
            name="projectShowcase"
            value={formData.clientQuestions.projectShowcase}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="serviceGuaranteeCertificate"
          checked={formData.serviceGuaranteeCertificate}
          onChange={handleChange}
        />
        Service Guarantee Certificate
      </label>
      <div>
        <label>
          What guarantees do you currently offer clients?
          <input
            type="text"
            name="serviceGuaranteeCertificate"
            value={formData.clientQuestions.serviceGuaranteeCertificate}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="promotionalItems"
          checked={formData.promotionalItems}
          onChange={handleChange}
        />
        Promotional Items
      </label>
      <div>
        <label>
          What budget do you have for promotional items?
          <input
            type="text"
            name="promotionalItems"
            value={formData.clientQuestions.promotionalItems}
            onChange={handleChange}
          />
        </label>
      </div>

      <h3>Digital Marketing</h3>
      <label>
        <input
          type="checkbox"
          name="websiteEnhancement"
          checked={formData.websiteEnhancement}
          onChange={handleChange}
        />
        Website Enhancement
      </label>
      <div>
        <label>
          Do you have client testimonials we can feature?
          <input
            type="text"
            name="websiteEnhancement"
            value={formData.clientQuestions.websiteEnhancement}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="localSEOPackage"
          checked={formData.localSEOPackage}
          onChange={handleChange}
        />
        Local SEO Package
      </label>
      <div>
        <label>
          Which geographic areas are most important to target?
          <input
            type="text"
            name="localSEOPackage"
            value={formData.clientQuestions.localSEOPackage}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="contentCreation"
          checked={formData.contentCreation}
          onChange={handleChange}
        />
        Content Creation
      </label>
      <div>
        <label>
          What topics would establish you as an expert?
          <input
            type="text"
            name="contentCreation"
            value={formData.clientQuestions.contentCreation}
            onChange={handleChange}
          />
        </label>
      </div>

      <h3>Targeted Campaigns</h3>
      <label>
        <input
          type="checkbox"
          name="lodgeHospitalityCampaign"
          checked={formData.lodgeHospitalityCampaign}
          onChange={handleChange}
        />
        Lodge/Hospitality Campaign
      </label>
      <div>
        <label>
          Which specific lodges would you like to target?
          <input
            type="text"
            name="lodgeHospitalityCampaign"
            value={formData.clientQuestions.lodgeHospitalityCampaign}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="businessCommercialCampaign"
          checked={formData.businessCommercialCampaign}
          onChange={handleChange}
        />
        Business/Commercial Campaign
      </label>
      <div>
        <label>
          What types of businesses benefit most from your services?
          <input
            type="text"
            name="businessCommercialCampaign"
            value={formData.clientQuestions.businessCommercialCampaign}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="agriculturalFarmCampaign"
          checked={formData.agriculturalFarmCampaign}
          onChange={handleChange}
        />
        Agricultural/Farm Campaign
      </label>
      <div>
        <label>
          What specific cooling needs do farms in the area have?
          <input
            type="text"
            name="agriculturalFarmCampaign"
            value={formData.clientQuestions.agriculturalFarmCampaign}
            onChange={handleChange}
          />
        </label>
      </div>

      <h3>Local Advertising</h3>
      <label>
        <input
          type="checkbox"
          name="vehicleEnhancement"
          checked={formData.vehicleEnhancement}
          onChange={handleChange}
        />
        Vehicle Enhancement
      </label>
      <div>
        <label>
          Would you consider more permanent vehicle branding now?
          <input
            type="text"
            name="vehicleEnhancement"
            value={formData.clientQuestions.vehicleEnhancement}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="localPrintAdvertising"
          checked={formData.localPrintAdvertising}
          onChange={handleChange}
        />
        Local Print Advertising
      </label>
      <div>
        <label>
          Which local publications do your potential clients read?
          <input
            type="text"
            name="localPrintAdvertising"
            value={formData.clientQuestions.localPrintAdvertising}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="communitySignage"
          checked={formData.communitySignage}
          onChange={handleChange}
        />
        Community Signage
      </label>
      <div>
        <label>
          Do you have locations where you could place signage?
          <input
            type="text"
            name="communitySignage"
            value={formData.clientQuestions.communitySignage}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="referralProgram"
          checked={formData.referralProgram}
          onChange={handleChange}
        />
        Referral Program
      </label>
      <div>
        <label>
          What incentive could you offer for referrals?
          <input
            type="text"
            name="referralProgram"
            value={formData.clientQuestions.referralProgram}
            onChange={handleChange}
          />
        </label>
      </div>

      <button type="submit">Submit</button>
    </form>
  );
};

export default SurveyPage2;
