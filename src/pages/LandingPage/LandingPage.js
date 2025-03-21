import React from 'react';
import { Link } from 'react-router-dom';

const LandingPage = () => {
  return (
    <div>
      <h1>Executive Summary</h1>
      <h2>Phased Marketing Approach for Refrigeration & Air Conditioning Services</h2>
      <p>
        This document provides an overview of our recommended four-phase marketing approach for your one-man refrigeration and air conditioning business serving Bela Bela, Thabazimbi, and Modimolle. Each phase builds strategically on the previous one, allowing for controlled growth and targeted expansion from private sector to government clients.
      </p>

      <h2>Phased Approach Overview</h2>
      <h3>Phase 1: Foundation (1-3 months)</h3>
      <p>
        <em>Establishing your professional brand and essential marketing presence</em>
      </p>
      <ul>
        <li>Professional brand development (logo, colors, messaging)</li>
        <li>Essential marketing materials (business cards, brochures)</li>
        <li>Basic digital presence (website, Google Business)</li>
        <li>Local visibility foundations</li>
      </ul>
      <p>
        <strong>Expected Outcomes:</strong>
      </p>
      <ul>
        <li>Professional brand identity established</li>
        <li>Basic marketing materials in place</li>
        <li>Functional website generating initial inquiries</li>
        <li>Improved local visibility</li>
        <li>10-15% increase in service inquiries</li>
      </ul>
      <p>
        <strong>Investment Range:</strong> R15,000 - R25,000 (based on selected components)
      </p>

      <h3>Phase 2: Private Sector Penetration (4-9 months)</h3>
      <p>
        <em>Targeting lodges, businesses, and agricultural clients</em>
      </p>
      <ul>
        <li>Sector-specific marketing materials</li>
        <li>Enhanced digital presence and content</li>
        <li>Targeted campaigns for key industries</li>
        <li>Local advertising and relationship marketing</li>
        <li>Referral program implementation</li>
      </ul>
      <p>
        <strong>Expected Outcomes:</strong>
      </p>
      <ul>
        <li>25-40% increase in private sector client base</li>
        <li>Established relationships with 5-8 key lodges/businesses</li>
        <li>Recurring maintenance contracts with 3-5 major clients</li>
        <li>20-30% increase in revenue from private sector</li>
      </ul>
      <p>
        <strong>Investment Range:</strong> R18,000 - R35,000 (based on selected components)
      </p>

      <h3>Phase 3: Public Sector Preparation (10-12 months)</h3>
      <p>
        <em>Building capabilities for government and municipal contracts</em>
      </p>
      <ul>
        <li>Tender and compliance documentation</li>
        <li>Government-focused marketing materials</li>
        <li>Municipal relationship building</li>
        <li>Supplier database registrations</li>
        <li>Technical capability statements</li>
      </ul>
      <p>
        <strong>Expected Outcomes:</strong>
      </p>
      <ul>
        <li>Complete readiness for government tender processes</li>
        <li>Initial contacts with 2-3 municipal departments</li>
        <li>Qualification for government supplier databases</li>
        <li>First public sector proposal submissions</li>
      </ul>
      <p>
        <strong>Investment Range:</strong> R12,000 - R25,000 (based on selected components)
      </p>

      <h3>Phase 4: Public Sector Expansion (13-18 months)</h3>
      <p>
        <em>Actively pursuing municipal and government contracts</em>
      </p>
      <ul>
        <li>Municipal outreach program</li>
        <li>Tender response capabilities</li>
        <li>Government-specific campaigns</li>
        <li>Partnership development</li>
        <li>Maintenance contract proposals</li>
      </ul>
      <p>
        <strong>Expected Outcomes:</strong>
      </p>
      <ul>
        <li>Securing 1-2 municipal maintenance contracts</li>
        <li>15-20% of revenue derived from public sector</li>
        <li>Established reputation with government procurement</li>
        <li>Development of case studies from public projects</li>
      </ul>
      <p>
        <strong>Investment Range:</strong> R15,000 - R30,000 (based on selected components)
      </p>

      <h2>Key Benefits of This Approach</h2>
      <ol>
        <li><strong>Manageable Investment:</strong> Each phase has its own budget, allowing you to invest incrementally as your business grows.</li>
        <li><strong>Strategic Progression:</strong> Builds a strong foundation before pursuing more complex opportunities.</li>
        <li><strong>Balanced Client Portfolio:</strong> Develops stable private sector revenue while gradually adding government contracts.</li>
        <li><strong>Flexible Implementation:</strong> Components within each phase can be selected based on your priorities and budget.</li>
        <li><strong>Measurable Results:</strong> Clear metrics at each phase to evaluate success before proceeding.</li>
      </ol>

      <h2>Recommended Starting Point</h2>
      <p>
        We recommend beginning with Phase 1 (Foundation) to establish your professional brand presence. The minimum essential components would include:
      </p>
      <ul>
        <li>Logo & Visual Identity (R3,500)</li>
        <li>Business Cards (R1,200)</li>
        <li>Basic Service Brochure (R2,500)</li>
        <li>Vehicle Magnets (R1,500)</li>
        <li>Google Business Profile (R1,200)</li>
      </ul>
      <p>
        <strong>Minimum Starting Investment:</strong> R9,900
      </p>
      <p>
        For optimal results, we recommend including a basic website (additional R6,500) for a total starting investment of R16,400.
      </p>

      <h2>Next Steps</h2>
      <ol>
        <li>Review the detailed checklists for each phase</li>
        <li>Select your preferred components using the checkbox system</li>
        <li>Schedule a consultation to finalize your selections</li>
        <li>Receive a customized proposal with exact pricing</li>
        <li>Begin implementation with a 50% deposit</li>
      </ol>

      <div>
        <Link to="/survey1">Start Phase 1 Survey</Link>
        <Link to="/survey2">Start Phase 2 Survey</Link>
        <Link to="/survey3">Start Phase 3 Survey</Link>
        <Link to="/survey4">Start Phase 4 Survey</Link>
      </div>
    </div>
  );
};

export default LandingPage;
