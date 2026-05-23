DROP TABLE IF EXISTS DemoFields;

CREATE TABLE DemoFields (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Name TEXT NOT NULL,
  Description TEXT,
  Observations TEXT,
  Active BOOLEAN NOT NULL DEFAULT 0 CHECK (Active IN (0, 1)),
  Limited BOOLEAN NOT NULL DEFAULT 0 CHECK (Limited IN (0, 1)),
  Image BLOB
);

INSERT INTO DemoFields
  (Name, Description, Observations, Active, Limited, Image)
VALUES
  (
    'Customer onboarding',
    'This record contains a longer description used to demonstrate how memo fields can show full text instead of the default memo placeholder. It includes multiple details about a fictional customer onboarding process, validation steps, and internal notes.',
    'Observation generated for the demo: the customer profile was reviewed, the documents were checked, and the next follow-up should focus on confirming the commercial limits before activation.',
    1,
    0,
    NULL
  ),
  (
    'Product catalog review',
    'A detailed description for testing row height adjustment in the grid. The product catalog contains grouped items, technical descriptions, optional images, and different availability rules for each category.',
    'Observation generated for the demo: keep an eye on records with missing images because they are useful for validating how the grid behaves before and after a BLOB value is added.',
    0,
    1,
    NULL
  ),
  (
    'Support ticket audit',
    'This memo text simulates a support ticket with several paragraphs of information condensed into one field. It is intentionally verbose so the DataGrid can be tested with ShowMemoFields enabled and row auto-sizing applied.',
    'Observation generated for the demo: the ticket is closed, but the audit notes remain available for the operator to compare boolean rendering and memo rendering in the same row.',
    1,
    1,
    NULL
  ),
  (
    'Warehouse inspection',
    'Inspection notes for a warehouse area, including stock movement, shelf labeling, pending corrections, and quality-control comments. This field should be large enough to make the memo behavior visible in the grid.',
    'Observation generated for the demo: limited access was enabled during the inspection window, and the sample image can be inserted later through DBeaver into the Image BLOB field.',
    0,
    0,
    NULL
  ),
  (
    'Marketing campaign',
    'Campaign planning data with goals, target audience notes, scheduled publication dates, approval status, and creative review details. The text is meant to behave like a database memo field.',
    'Observation generated for the demo: the campaign remains active for testing checkboxes, and its image placeholder is intentionally empty until a JPEG, BMP, or GIF is inserted.',
    1,
    0,
    NULL
  ),
  (
    'Invoice reconciliation',
    'Financial reconciliation example with invoice references, payment matching, exception handling, and validation details. It provides another long field to test automatic row sizing with memo content.',
    'Observation generated for the demo: the item is currently limited because the reconciliation contains pending checks that should be visible in boolean column rendering.',
    0,
    1,
    NULL
  ),
  (
    'Training schedule',
    'Training schedule notes with session topics, instructor comments, classroom setup requirements, and expected attendee preparation. This sample is used only to populate the demo grid with realistic memo values.',
    'Observation generated for the demo: use this row to verify that both memo columns can be displayed together without truncating important content.',
    1,
    1,
    NULL
  ),
  (
    'Equipment maintenance',
    'Maintenance report containing service history, replacement parts, inspection outcome, and recommendations for future preventive actions. The memo length is deliberate for visual testing.',
    'Observation generated for the demo: the equipment is inactive while maintenance is pending, and a photo can be added later to validate ShowPictureFields.',
    0,
    0,
    NULL
  ),
  (
    'Delivery route check',
    'Route validation notes covering delivery windows, driver assignments, address exceptions, and expected delays. This description gives the memo column enough content to wrap across multiple lines.',
    'Observation generated for the demo: the route is active and can be used to compare checkbox rendering with longer descriptive content.',
    1,
    0,
    NULL
  ),
  (
    'Contract renewal',
    'Renewal process details with contract dates, customer negotiation points, internal approval stages, and additional service clauses. The text is intentionally long for memo display testing.',
    'Observation generated for the demo: limited approval is enabled until all contract attachments are reviewed by the commercial team.',
    0,
    1,
    NULL
  ),
  (
    'Inventory adjustment',
    'Inventory adjustment entry describing quantity differences, warehouse notes, manual counting results, and reconciliation comments. It provides another realistic memo field for the sample grid.',
    'Observation generated for the demo: active tracking remains enabled while the inventory differences are being analyzed.',
    1,
    1,
    NULL
  ),
  (
    'Quality review',
    'Quality review memo with inspection criteria, accepted tolerances, rejected samples, and recommendations for process improvements. This row helps test text wrapping in the grid.',
    'Observation generated for the demo: the item is inactive and unrestricted, which is useful for checking false values in both boolean columns.',
    0,
    0,
    NULL
  ),
  (
    'Purchase request',
    'Purchase request details including supplier suggestions, estimated costs, delivery expectations, and justification for approval. This description behaves like a memo field in the database adapter.',
    'Observation generated for the demo: the request is active, but no limitation is applied to the approval flow yet.',
    1,
    0,
    NULL
  ),
  (
    'Security access',
    'Security access notes listing user permissions, temporary access periods, audit requirements, and approval history. The memo field is long enough to make row auto-sizing visible.',
    'Observation generated for the demo: limited access is required for this sample, and an identity image can be added later as a BLOB.',
    0,
    1,
    NULL
  ),
  (
    'Service agreement',
    'Service agreement description with support levels, response times, maintenance windows, and escalation rules. This sample record exercises memo content and boolean display together.',
    'Observation generated for the demo: both boolean fields are true so the adapter can render two checked values in the same row.',
    1,
    1,
    NULL
  ),
  (
    'Asset retirement',
    'Asset retirement memo containing depreciation notes, final inspection results, disposal instructions, and accounting references. It is another long-text sample for visual validation.',
    'Observation generated for the demo: inactive and not limited, representing a closed item without restrictions.',
    0,
    0,
    NULL
  ),
  (
    'Customer survey',
    'Survey collection notes with response groups, satisfaction indicators, follow-up actions, and summary comments for management review. This row adds variety to the memo values.',
    'Observation generated for the demo: active survey tracking is enabled while limits remain disabled.',
    1,
    0,
    NULL
  ),
  (
    'Budget forecast',
    'Budget forecast text with planned expenses, expected revenue, contingency notes, and comparison against previous periods. It creates a longer memo cell for the DataGrid.',
    'Observation generated for the demo: forecast editing is limited until the financial department validates the numbers.',
    0,
    1,
    NULL
  ),
  (
    'Shipment exception',
    'Shipment exception report describing carrier communication, damaged package notes, replacement handling, and customer notification history. The description is verbose for memo testing.',
    'Observation generated for the demo: the exception remains active and limited while the replacement process is open.',
    1,
    1,
    NULL
  ),
  (
    'Office relocation',
    'Office relocation plan with room assignments, equipment movement, vendor scheduling, and communication tasks. This memo should wrap naturally when displayed in the grid.',
    'Observation generated for the demo: relocation planning is inactive in this sample and has no access limitation.',
    0,
    0,
    NULL
  ),
  (
    'Data migration',
    'Data migration notes including source validation, transformation rules, test execution, and post-migration checks. This is useful for testing larger memo content.',
    'Observation generated for the demo: active processing is enabled and the row can later receive an image that represents migration evidence.',
    1,
    0,
    NULL
  ),
  (
    'Compliance audit',
    'Compliance audit description with reviewed policies, evidence collected, responsible departments, and remediation activities. The text is long enough to demonstrate memo fields clearly.',
    'Observation generated for the demo: limitation is enabled because the audit contains controlled information.',
    0,
    1,
    NULL
  ),
  (
    'Production batch',
    'Production batch record with manufacturing notes, operator comments, quality gates, and packaging details. The memo is designed to produce visible multiline cells.',
    'Observation generated for the demo: active and limited flags are both enabled for batch traceability testing.',
    1,
    1,
    NULL
  ),
  (
    'Vendor evaluation',
    'Vendor evaluation memo covering price comparison, delivery reliability, documentation quality, and communication history. It provides another business-like long text field.',
    'Observation generated for the demo: the vendor is inactive for the sample and has no limitation applied.',
    0,
    0,
    NULL
  ),
  (
    'Event registration',
    'Event registration notes with attendee categories, meal preferences, room capacity, and confirmation status. This text helps validate memo rendering with ordinary operational data.',
    'Observation generated for the demo: registrations are active and unrestricted for this scenario.',
    1,
    0,
    NULL
  ),
  (
    'Maintenance schedule',
    'Maintenance schedule description with planned tasks, responsible technicians, expected downtime, and spare-part requirements. The memo value is intentionally not short.',
    'Observation generated for the demo: schedule editing is limited until the maintenance supervisor approves the plan.',
    0,
    1,
    NULL
  ),
  (
    'Return authorization',
    'Return authorization text with customer reason, item condition, approval notes, and refund or replacement instructions. It is another record for scrolling and row sizing tests.',
    'Observation generated for the demo: both active and limited values are true to show checked states side by side.',
    1,
    1,
    NULL
  ),
  (
    'Internal announcement',
    'Internal announcement draft containing the message objective, target audience, publication channel, and approval notes. This gives the memo columns additional varied content.',
    'Observation generated for the demo: inactive and not limited, representing a draft that is not currently in circulation.',
    0,
    0,
    NULL
  ),
  (
    'Project milestone',
    'Project milestone description with completed tasks, delayed items, stakeholder comments, and next-step planning. This sample is meant to be readable when memo fields are enabled.',
    'Observation generated for the demo: the milestone is active and available without limitation.',
    1,
    0,
    NULL
  ),
  (
    'Risk assessment',
    'Risk assessment memo listing impact, probability, mitigation actions, responsible owners, and monitoring frequency. It supplies another long row for the adapter demo.',
    'Observation generated for the demo: limitation is enabled because the risk information should be controlled.',
    0,
    1,
    NULL
  );
