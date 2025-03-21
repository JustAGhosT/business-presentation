import React, { useState } from 'react';

const SurveyPage1 = () => {
  const [formData, setFormData] = useState({
    logoVisualIdentity: false,
    brandMessaging: false,
    businessCards: false,
    basicServiceBrochure: false,
    vehicleMagnets: false,
    brandedWorkShirts: false,
    basicWebsite: false,
    googleBusinessProfile: false,
    socialMediaSetup: false,
    localSearchOptimization: false,
    directOutreachTools: false,
    clientQuestions: {
      logoVisualIdentity: '',
      brandMessaging: '',
      businessCards: '',
      basicServiceBrochure: '',
      vehicleMagnets: '',
      brandedWorkShirts: '',
      basicWebsite: '',
      googleBusinessProfile: '',
      socialMediaSetup: '',
      localSearchOptimization: '',
      directOutreachTools: '',
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
      <h2>Phase 1: Foundation</h2>

      <h3>Brand Development</h3>
      <label>
        <input
          type="checkbox"
          name="logoVisualIdentity"
          checked={formData.logoVisualIdentity}
          onChange={handleChange}
        />
        Logo & Visual Identity
      </label>
      <div>
        <label>
          Do you have any color preferences for your brand?
          <input
            type="text"
            name="logoVisualIdentity"
            value={formData.clientQuestions.logoVisualIdentity}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="brandMessaging"
          checked={formData.brandMessaging}
          onChange={handleChange}
        />
        Brand Messaging
      </label>
      <div>
        <label>
          What makes your service better than competitors?
          <input
            type="text"
            name="brandMessaging"
            value={formData.clientQuestions.brandMessaging}
            onChange={handleChange}
          />
        </label>
      </div>

      <h3>Essential Marketing Materials</h3>
      <label>
        <input
          type="checkbox"
          name="businessCards"
          checked={formData.businessCards}
          onChange={handleChange}
        />
        Business Cards
      </label>
      <div>
        <label>
          What contact information should be included?
          <input
            type="text"
            name="businessCards"
            value={formData.clientQuestions.businessCards}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="basicServiceBrochure"
          checked={formData.basicServiceBrochure}
          onChange={handleChange}
        />
        Basic Service Brochure
      </label>
      <div>
        <label>
          What are your primary services to highlight?
          <input
            type="text"
            name="basicServiceBrochure"
            value={formData.clientQuestions.basicServiceBrochure}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="vehicleMagnets"
          checked={formData.vehicleMagnets}
          onChange={handleChange}
        />
        Vehicle Magnets
      </label>
      <div>
        <label>
          What type/model of vehicle do you have?
          <input
            type="text"
            name="vehicleMagnets"
            value={formData.clientQuestions.vehicleMagnets}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="brandedWorkShirts"
          checked={formData.brandedWorkShirts}
          onChange={handleChange}
        />
        Branded Work Shirts
      </label>
      <div>
        <label>
          Do you prefer polo shirts or button-ups?
          <input
            type="text"
            name="brandedWorkShirts"
            value={formData.clientQuestions.brandedWorkShirts}
            onChange={handleChange}
          />
        </label>
      </div>

      <h3>Digital Presence</h3>
      <label>
        <input
          type="checkbox"
          name="basicWebsite"
          checked={formData.basicWebsite}
          onChange={handleChange}
        />
        Basic Website
      </label>
      <div>
        <label>
          Do you have an existing domain name or need a new one?
          <input
            type="text"
            name="basicWebsite"
            value={formData.clientQuestions.basicWebsite}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="googleBusinessProfile"
          checked={formData.googleBusinessProfile}
          onChange={handleChange}
        />
        Google Business Profile
      </label>
      <div>
        <label>
          What are your business hours?
          <input
            type="text"
            name="googleBusinessProfile"
            value={formData.clientQuestions.googleBusinessProfile}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="socialMediaSetup"
          checked={formData.socialMediaSetup}
          onChange={handleChange}
        />
        Social Media Setup
      </label>
      <div>
        <label>
          Are you comfortable maintaining social media yourself?
          <input
            type="text"
            name="socialMediaSetup"
            value={formData.clientQuestions.socialMediaSetup}
            onChange={handleChange}
          />
        </label>
      </div>

      <h3>Local Marketing</h3>
      <label>
        <input
          type="checkbox"
          name="localSearchOptimization"
          checked={formData.localSearchOptimization}
          onChange={handleChange}
        />
        Local Search Optimization
      </label>
      <div>
        <label>
          What specific services should we highlight for local search?
          <input
            type="text"
            name="localSearchOptimization"
            value={formData.clientQuestions.localSearchOptimization}
            onChange={handleChange}
          />
        </label>
      </div>

      <label>
        <input
          type="checkbox"
          name="directOutreachTools"
          checked={formData.directOutreachTools}
          onChange={handleChange}
        />
        Direct Outreach Tools
      </label>
      <div>
        <label>
          Do you have any existing client contacts?
          <input
            type="text"
            name="directOutreachTools"
            value={formData.clientQuestions.directOutreachTools}
            onChange={handleChange}
          />
        </label>
      </div>

      <button type="submit">Submit</button>
    </form>
  );
};

export default SurveyPage1;
