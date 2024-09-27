# Cloud Security Posture Management: Cloud Guard Notification 

Lab 20 Practices

Estimated time: 30 mins

## Get Started

### Overview

Cloud Guard Notification is a feature in Oracle Cloud Infrastructure
(OCI) that sends real-time alerts for security problems detected by
Cloud Guard. These alerts can be customized and delivered to various
notification channels such as email, SMS, or PagerDuty. Cloud Guard
Notification helps organizations to proactively detect and respond to
security threats in their OCI environments.

In this lab, you will:

- Create and configure a Cloud Guard Target.

- Ensure Cloud Event rule is enabled.

- Configure Notification service.

- Configure Events service.

- Creating a Scenario for Cloud Guard Notification.

- Verify Cloud Guard Notification.

### Prerequisites

- You must have access to the OCI Console.

- The Oracle University lab team has set up all the IAM policies
  required for you to complete this lab. <span class="mark"></span>

### Assumptions

- Select the region that’s available in the tenancy allotted to you. In
  this lab, we are considering US East (Ashburn) (IAD) as your region.

- You must be familiar with navigating the OCI Console.

## Create and configure a Cloud Guard Target 

You will learn how to add a target to set the scope of resources that
Cloud Guard monitors. You will also learn how to check if the cloud
event rule in the responder recipe is enabled for your specified target.

**Note:** It is important to note that Cloud Guard is already enabled in
your practice tenancy.

### Task-1: Create a Cloud Guard for your assigned compartment

1.  From the navigation menu, select **Identity & Security**, and then
    click **Cloud Guard**.

<!-- -->

1.  In the left navigation pane, under **Cloud Guard**, click
    **Targets.**

2.  In the left navigation pane, under **Scope**, select *\<your
    assigned compartment\>* from the drop-down menu.

**Note:** If you already have a specific target set for your
compartment, delete it.

3.  Click **Create new target**.

<!-- -->

1.  Enter the following:

<!-- -->

1.  **Target Name:** IAD-SP-LAB20-1-CG-01

2.  **Description:** Enter a meaningful description.

3.  **Compartment:** *\<your assigned compartment*\>

<!-- -->

2.  Click **Next**, for recipes configuration.

    - Under **Posture and threat monitoring recipes** select detector
      recipe**:**

      - OCI Configuration Detector Recipe (Oracle managed)

      - OCI Threat Detector Recipe (Oracle managed)

      - OCI Activity Detector Recipe (Oracle managed)

    - Under **Instance Security recipe** select detector recipe**:**

      1)  Select **All compute instances**

      - Select OCI Instance Security Detector Recipe (Oracle managed)

3.  Click **Next** to review the information and then click **Create**
    to create target.

    The detail page for the new target will be displayed. Under
    Configuration, view the detector recipes associated with the created
    target.

### Task-2: Add Responder recipe and ensure Cloud Event rule is enabled

You can utilize Cloud Guard's notification responder called Cloud Event,
which emits problem details to the Events service. To make use of the
Cloud Event responder rule, you must attach the OCI Responder Recipe
(Oracle managed) to your target. It's important to note that the Cloud
Event rule is already enabled by default. However, if you clone the
recipe to customize it, you must ensure that you enable the cloud event
rule.

1.  From the navigation menu, select **Identity & Security**, and then
    click **Cloud Guard**.

<!-- -->

4.  In the left navigation pane, under **Cloud Guard**, click
    **Targets** under **Configuration.**

5.  Click IAD-SP-LAB20-1-CG-01 target to view details and add responder
    recipe.

6.  Under **Responder recipe** click **Add recipes.**

7.  Select **OCI Responder Recipe (Oracle managed)** and click **Add
    recipes.**

8.  Click on **OCI Responder Recipe (Oracle managed).**

9.  Locate **Cloud Event** rule, under Responder rules.

10. Confirm that the status column for Cloud Event rule is **Enabled**.

11. Next, ensure that the Cloud Event responder rule is set to execute
    automatically

12. In Cloud Event responder rule row, open
    the Actions menu <img src="media/image1.png" style="height:0.24028in"
    alt="Image of Action menu" />, and select **Edit**.

13. On **Configure Responder Rule** dialog box, **Setting** section,
    check the **Rule Trigger** setting.

- Ensure **Execute Automatically** checkbox is selected.

- Select the **CONFIRM EXECUTE AUTOMATICALLY** check box.

14. Click **Save**.

    You have created a Cloud Guard target and confirmed that the Cloud
    Event responder rule is enabled.

## Configure Notification service

Once you have confirmed that the Cloud Event responder rule is enabled,
you will learn how to create a notification so that the relevant parties
can be informed when Cloud Guard detects a problem in the monitoring
target. For instance, you may want to set up an email to be sent to an
administrator in response to an event.

### Task: Create a Topic and a Subscription Inside a Topic

1.  From the navigation menu, select **Developer Services**. Navigate to
    **Application Integration** and select **Notifications**.

2.  From the left-navigation panel, ensure that you are in *\<your
    assigned compartment\>.*

3.  Click **Create Topic**.

4.  In the Create Topic dialog box, provide the following details:

    - **Name**:  IAD-SP-LAB20-1-TOP-01

    - **Description**: Optional

5.  Click **Create**.

6.  After the topic state changes to **Active**, click the topic to view
    the details.

7.  Under Resources, click **Create Subscription**.

8.  Select **Email** in the Protocol field.

9.  In the Email field, enter your email address.

10. Click **Create**.

11. Click the subscription that you just created.

> The Subscription Information will be displayed with the status
> as Pending Confirmation.

12. Check the email account you specified and click the “Confirm
    subscription” verification link in it. A pop-up browser window will
    tell you that the subscription has been confirmed.

13. Navigate back to the **Subscriptions** page and verify that the
    subscription status has changed to **Active**.

> **Note:** You may need to refresh your browser if the status is not
> updated.

A topic and a subscription inside a topic are successfully created.

## Configure Events service

You will learn how to configure a rule in the Event service that
specifies the conditions under which a Cloud Guard event notification
should be sent.

### Task: Configure a rule for Cloud Guard event type

1.  From the navigation menu, select **Observability & Management**,
    then click **Events Service**.

2.  From the left-navigation panel, ensure that you are in *\<your
    assigned compartment\>.*

3.  Under Resources, select **Rules,** click **Create Rule.**

4.  On **Create Rule** dialog box, enter the following:

    - **Name**: IAD-SP-LAB20-1-RULE-01

    - **Description:** Enter a meaningful description.

    - Under **Rule Condition** section:

      - **Condition**: Select **Event Type**

      - **Service Name:** Select **Cloud Guard**

      - **Event Type**: Set **Detected - Problem, Remediated - Problem**
        and **Cloud Guard – Announcements**

    - Under **Action** section:

      - **Action Type**: Select **Notification**

      - **Notification Compartment**: select *\<your assigned
        compartment\>*

      - **Topic**: Select IAD-SP-LAB20-1-TOP-01

5.  Click **Create** **Rule.**

    Your Cloud Guard event rule is successfully created.

6.  Under **Resources** in the left navigation panel, click **Event
    Matching**.

    Verify that the appropriate event types are set for this rule.

7.  Under **Resources** in the left navigation panel, click **Action**.

    Check that the action type is set to notification, the state is
    Enabled, and the topic is configured to IAD-SP-LAB20-1-TOP-01.

## Creating a Scenario for Cloud Guard Notification

To receive notifications for any problems detected in your set target,
you need to create a bucket and make it publicly visible. Additionally,
you can also verify the activity of the Cloud Event responder rule.

### Task-1: Configure Network source to allow bucket creation

You need to update your public IP address in Network Source before
creating a bucket.

**Note:** if your public IP address is already listed as a network
source, you can skip Task 1 and move directly to Task 2.

1.  To obtain your public IP address, open a web browser and perform a
    Google search for "what is my public ip?"

    Note down the Public IP address.

2.  From the navigation menu, click **Identity & Security**, and then
    click **Network Sources**

3.  Locate and click the IAD-SP-LAB05-1-NS-01 network source in the list
    to view its details.

    In your environment, an IAD-SP-LAB05-1-NS-01 network source is
    pre-created.

4.  Click **Add Networks**.

5.  In the **Add Networks** dialog box, enter the following:

    - **Network type**: Public Network

    - **IP Address/CIDR Block**: \<YOUR_PUBLIC_IP_ADDRESS\>

6.  Click **Update**.

    Your public IP address or CIDR block has successfully been added as
    a network to the IAD-SP-LAB05-1-NS-01 network source.

### Task-2: Create a bucket with public visibility

1.  From the navigation menu, click **Storage**. Navigate to Object
    Storage, and then click **Buckets**.

2.  In the left navigation pane, under List Scope, select
    *\<your assigned compartment\>* from the drop-down menu.

3.  Click **Create Bucket**.

4.  In the **Create Bucket** dialog box, specify the attributes of the
    bucket:

    - **Bucket Name:** IAD-SP-LAB20-1-BKT-01-\<user-id\>

      Please specify your user id in place of \<user-id\> to make it
      unique.

    - **Default Storage Tier:** Select Standard.

**Note:** Leave all the other options in their default setting.

5.  Click **Create**.

    You can see the bucket listed for your compartment.

6.  Click the three dots on the right to open the Actions menu and
    select **Edit Visibility**. Select **Public** and click **Save
    Changes**.

    **Note**: You have successfully created a bucket with public
    visibility in the assigned compartment. However, to ensure proper
    cloud security posture, the detector recipe has a configuration rule
    that requires buckets to be private.

    So, you need to wait for Cloud Guard to evaluate your allocated
    detector configuration and check for any problems in the set target.

    It is suggested that you wait for 25-30 minutes before reviewing the
    Cloud Guard Dashboard to check if any problems have been identified
    and to receive notifications triggered by the event service.

## Verify Cloud Guard Notification

After a problem is detected in your set target, you will receive an
email notification that contains detailed information about the detected
problem. You can also verify the activity of the Cloud Event responder
rule.

### Task-1: Reading the Email Notification

1.  You will receive an email notification to the configured
    subscription email of the Notifications Topic with the subject:

    "OCI Event Notification
    :com.oraclecloud.cloudguard.problemdetected".

2.  The email contains important information such as the resource OCID,
    problem name, risk level, target ID, and more.

    Here's a sample of what the email might look like:

{  
  "eventType" : "com.oraclecloud.cloudguard.problemdetected",  
  "cloudEventsVersion" : "0.1",  
  "eventTypeVersion" : "2.0",  
  "source" : "CloudGuardResponderEngine",  
  "eventTime" : "2022-12-24T02:38:00Z",  
  "contentType" : "application/json",  
  "data" : {  
    "compartmentId" : "ocid1.compartment.oc1..aaaaaxxxxxxxxxx",  
    "compartmentName" : "demo",  
    "resourceName" : "Bucket is public",  
    "resourceId" :
"ocid1.cloudguardproblem.oc1.iad.amaaaaaajcisnjkxxxxxxxxx",  
    "additionalDetails" : {  
      "tenantId" : "ocid1.tenancy.oc1..aaaaaaaxxxxxxxxx",  
      "status" : "OPEN",  
      "reason" : "New Problem detected by CloudGuard",  
      "problemName" : "BUCKET_IS_PUBLIC",  
      "riskLevel" : "CRITICAL",  
      "problemType" : "CONFIG_CHANGE",  
      "resourceName" : "bucket-20xxx5-1410",  
      "resourceId" : "ocuocxxxxx/bucket-20xxxx5-1410",  
      "resourceType" : "Bucket",  
      "targetId" :
"ocid1.cloudguardtarget.oc1.iad.amaaaaallkxxxxxxxxxx",  
      "labels" : "CIS_OCI_V1.1_OBJECTSTORAGE, ObjectStorage",  
      "firstDetected" : "2024-5-24T02:37:41.435Z",  
      "lastDetected" : "2023-5-24T08:37:41.435Z",  
      "region" : "us-ashburn-1",

### Task-2: Check activities for Cloud Event responder rule

1.  From the navigation menu, select **Identity & Security**, and then
    click **Cloud Guard**.

<!-- -->

15. In the left navigation pane, under **Cloud Guard**, click
    **Problems** under **Alerts.**

16. In the left navigation pane, under **Scope**, select *\<your
    assigned compartment\>* from the drop-down menu.

17. In the left navigation pane, under Resource type**,** select
    **Bucket** from the drop-down menu.

18. Click “**Bucket is Public**” from the problem list.

19. Under **Resources** in the left navigation panel, click **Responder
    activity**.

20. Check **Cloud Event** activity row:

    - **Activity**: Completed

    - **Responder execution status**: Succeeded.

      This activity confirm that the Cloud Event responder rule is being
      triggered and events are being created for the problem in the
      Events service.

      Similarly, you will receive a notification whenever a problem is
      detected or remediated for a set target.

      Congratulations! You have successfully completed the task of
      configuring Cloud Guard notifications. You will now receive email
      notifications whenever Cloud Guard detects a problem in your set
      target. You have also verified the activity of the Cloud Event
      responder rule in the Cloud Guard problem console, ensuring that
      event service is being triggered for detected problems. These
      timely notifications will help you maintain the security and
      integrity of your OCI resources.

## Purge Instructions

Perform the purge operation, as instructed below:

### Delete Bucket

1.  From the navigation menu, select **Storage**. Navigate to Object
    Storage, then click **Buckets**.

2.  In the left navigation pane, under List Scope, select
    *\<your assigned compartment\>* from the drop-down menu.

3.  Click the Bucket: **IAD-SP-LAB20-1-BKT-01-\<user-id\>**

4.  Click **Delete** and then enter the Bucket name and click **Delete**
    in the Confirmation window.

### Delete Cloud guard Target

1.  From the navigation menu, select Identity & Security, and then click
    **Cloud Guard**.

2.  In the left navigation pane, under List Scope, select
    *\<your assigned compartment\>* from the drop-down menu.

3.  Select **Targets** under **Configurations**.

4.  Click **IAD-SP-LAB20-1-CG-01**.

5.  Click **Delete.**

6.  Then select the check box and click **Delete target(s)** in the
    Confirmation window.

### Delete Topics and Subscriptions

1.  From the navigation menu, select **Developer Services**. Navigate to
    **Application Integration** and click **Notifications**.

<!-- -->

1.  Click the topic **IAD-SP-LAB20-1-TOP-01**.

2.  Click the three dots on the right corresponding to the subscription
    to open the Actions menu and select **Delete**.

3.  Click **Delete Subscription** to confirm.

4.  Navigate back to the **Notifications** page.

5.  Click the three dots on the right corresponding to the topic to open
    the Actions menu and select **Delete**.

6.  Click **Delete Topic** to confirm.

### Delete Event service rule

1.  From the navigation menu, select **Observability & Management**,
    then click **Events Service**.

2.  From the left-navigation panel, ensure that you are in *\<your
    assigned compartment\>.*

3.  Under Resources, select **Rules.**

4.  Click the rule **IAD-SP-LAB20-1-RULE-01**

5.  On rule details page, Click **More actions,** and Click **Delete.**

6.  Type **“DELETE”** and Click **Delete** to confirm.
